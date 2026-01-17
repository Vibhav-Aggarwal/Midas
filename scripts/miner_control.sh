#!/usr/bin/env bash
# Midas Mining Control Script
# Manages TeamRedMiner operations on GPU server

set -euo pipefail

# Load configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="${SCRIPT_DIR}/../config/mining.conf"

if [ -f "${CONFIG_FILE}" ]; then
    source "${CONFIG_FILE}"
else
    echo "Error: Configuration file not found: ${CONFIG_FILE}"
    exit 1
fi

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m'

# Logging functions
log_info() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] ${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] ${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] ${RED}[ERROR]${NC} $1"
}

# Check if miner is running
is_running() {
    pgrep -f "${MINER_BINARY}" > /dev/null 2>&1
}

# Start mining
start_miner() {
    if is_running; then
        log_warn "Miner is already running"
        return 1
    fi

    log_info "Starting ${MINER_BINARY}..."

    # Build command line arguments
    local CMD="${MINER_PATH}/${MINER_BINARY} \
        -a ${ALGORITHM} \
        -o ${POOL_URL} \
        -u ${WALLET_ADDRESS}.${WORKER_NAME} \
        -d ${GPU_DEVICES} \
        --api_listen=0.0.0.0:${METRICS_PORT:-9100}"

    # Start miner in background
    nohup ${CMD} > "${LOG_DIR}/miner.log" 2>&1 &
    local PID=$!

    sleep 3

    if is_running; then
        log_info "Miner started successfully (PID: ${PID})"
        echo ${PID} > /tmp/midas_miner.pid
        return 0
    else
        log_error "Failed to start miner"
        return 1
    fi
}

# Stop mining
stop_miner() {
    if ! is_running; then
        log_warn "Miner is not running"
        return 1
    fi

    log_info "Stopping ${MINER_BINARY}..."

    pkill -SIGTERM -f "${MINER_BINARY}"
    sleep 2

    # Force kill if still running
    if is_running; then
        log_warn "Miner didn't stop gracefully, force killing..."
        pkill -SIGKILL -f "${MINER_BINARY}"
        sleep 1
    fi

    if ! is_running; then
        log_info "Miner stopped successfully"
        rm -f /tmp/midas_miner.pid
        return 0
    else
        log_error "Failed to stop miner"
        return 1
    fi
}

# Restart mining
restart_miner() {
    log_info "Restarting miner..."
    stop_miner || true
    sleep 2
    start_miner
}

# Check miner status
status() {
    if is_running; then
        local PID=$(pgrep -f "${MINER_BINARY}")
        log_info "Miner is running (PID: ${PID})"

        # Show last 10 log lines
        if [ -f "${LOG_DIR}/miner.log" ]; then
            echo ""
            echo "Recent logs:"
            tail -10 "${LOG_DIR}/miner.log"
        fi
        return 0
    else
        log_warn "Miner is not running"
        return 1
    fi
}

# Show help
show_help() {
    cat << EOF
Midas Miner Control Script

Usage: $0 [COMMAND]

Commands:
    start       Start the miner
    stop        Stop the miner
    restart     Restart the miner
    status      Show miner status
    logs        Show live logs (tail -f)
    help        Show this help message

Examples:
    $0 start
    $0 status
    $0 logs

Configuration: ${CONFIG_FILE}
EOF
}

# Show live logs
show_logs() {
    if [ -f "${LOG_DIR}/miner.log" ]; then
        tail -f "${LOG_DIR}/miner.log"
    else
        log_error "Log file not found: ${LOG_DIR}/miner.log"
        return 1
    fi
}

# Main command dispatcher
main() {
    case "${1:-}" in
        start)
            start_miner
            ;;
        stop)
            stop_miner
            ;;
        restart)
            restart_miner
            ;;
        status)
            status
            ;;
        logs)
            show_logs
            ;;
        help|--help|-h)
            show_help
            ;;
        *)
            echo "Error: Unknown command '${1:-}'"
            echo ""
            show_help
            exit 1
            ;;
    esac
}

main "$@"
