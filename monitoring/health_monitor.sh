#!/usr/bin/env bash
# Midas Mining Health Monitor
# Monitors GPU health and miner performance

set -euo pipefail

# Load configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="${SCRIPT_DIR}/../config/mining.conf"

if [ -f "${CONFIG_FILE}" ]; then
    source "${CONFIG_FILE}"
fi

LOG_FILE="${LOG_DIR:-/tmp}/midas_health.log"

# Logging
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "${LOG_FILE}"
}

# Check GPU temperatures
check_gpu_temps() {
    log "Checking GPU temperatures..."

    local MAX_TEMP=0
    local GPU_COUNT=0

    # Use rocm-smi to check AMD GPU temps
    if command -v rocm-smi &> /dev/null; then
        local TEMPS=$(rocm-smi --showtemp | grep -oP 'Temperature.*?:\s*\K[0-9]+' || echo "")

        if [ -n "${TEMPS}" ]; then
            while IFS= read -r temp; do
                GPU_COUNT=$((GPU_COUNT + 1))
                log "GPU${GPU_COUNT} Temperature: ${temp}°C"

                if [ ${temp} -gt ${MAX_TEMP} ]; then
                    MAX_TEMP=${temp}
                fi

                # Check emergency temperature
                if [ ${temp} -ge ${EMERGENCY_TEMP:-85} ]; then
                    log "CRITICAL: GPU${GPU_COUNT} at emergency temperature ${temp}°C!"
                    if [ "${AUTO_SHUTDOWN_ON_OVERHEAT:-false}" = "true" ]; then
                        emergency_shutdown "GPU overheating"
                    fi
                fi
            done <<< "${TEMPS}"
        fi
    else
        log "WARNING: rocm-smi not found, cannot check GPU temps"
    fi

    log "Max GPU temperature: ${MAX_TEMP}°C"
    return 0
}

# Check miner process
check_miner_process() {
    if pgrep -f "${MINER_BINARY:-teamredminer}" > /dev/null; then
        log "Miner process: RUNNING"
        return 0
    else
        log "WARNING: Miner process not running"
        return 1
    fi
}

# Emergency shutdown
emergency_shutdown() {
    local REASON="$1"
    log "EMERGENCY SHUTDOWN: ${REASON}"

    # Stop miner
    pkill -SIGTERM -f "${MINER_BINARY:-teamredminer}" || true
    sleep 2
    pkill -SIGKILL -f "${MINER_BINARY:-teamredminer}" || true

    log "Miner stopped due to: ${REASON}"

    # Could add alert here (email, webhook, etc.)
}

# Main monitoring loop
monitor() {
    log "Midas Health Monitor started"
    log "Check interval: ${HEALTH_CHECK_INTERVAL:-60}s"

    while true; do
        log "--- Health Check ---"

        check_gpu_temps
        check_miner_process

        log "--- Check Complete ---"
        log ""

        sleep ${HEALTH_CHECK_INTERVAL:-60}
    done
}

# One-time health check
health_check() {
    log "Running one-time health check..."
    check_gpu_temps
    check_miner_process
    log "Health check complete"
}

# Show help
show_help() {
    cat << EOF
Midas Mining Health Monitor

Usage: $0 [COMMAND]

Commands:
    monitor     Start continuous monitoring loop
    check       Run one-time health check
    help        Show this help

Examples:
    $0 monitor
    $0 check
EOF
}

# Main
case "${1:-monitor}" in
    monitor)
        monitor
        ;;
    check)
        health_check
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo "Unknown command: $1"
        show_help
        exit 1
        ;;
esac
