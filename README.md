# Project Midas

**Cryptocurrency Mining Operations & Optimization**

Automated mining management system for multi-GPU operations with health monitoring and performance optimization.

---

## 🎯 Overview

Midas manages cryptocurrency mining operations on the GPU server (4x AMD RX 570 GPUs) using TeamRedMiner for Ergo (Autolykos2) mining.

**Features:**
- Automated miner control (start/stop/restart)
- GPU health monitoring with temperature safety
- Performance tracking and alerts
- Auto-restart on failures
- Configurable mining parameters

---

## 📁 Project Structure

```
midas/
├── config/
│   └── mining.conf           # Mining configuration
├── scripts/
│   └── miner_control.sh      # Miner management
├── monitoring/
│   └── health_monitor.sh     # GPU health monitoring
├── logs/                     # Log directory
├── README.md                 # This file
└── CLAUDE.md                 # AI development guide
```

---

## 🚀 Quick Start

### 1. Configure Mining

Edit `config/mining.conf`:
```bash
# Set your wallet address
WALLET_ADDRESS="YOUR_ERGO_WALLET_ADDRESS"

# Configure pool
POOL_URL="stratum+tcp://pool.ergopool.io:3333"

# GPU settings
GPU_POWER_LIMIT="120"
GPU_TEMP_LIMIT="75"
```

### 2. Start Mining

```bash
# Start the miner
./scripts/miner_control.sh start

# Check status
./scripts/miner_control.sh status

# View live logs
./scripts/miner_control.sh logs
```

### 3. Monitor Health

```bash
# Run continuous monitoring
./monitoring/health_monitor.sh monitor

# Or one-time check
./monitoring/health_monitor.sh check
```

---

## 🔧 Configuration

### Mining Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `POOL_URL` | - | Mining pool address |
| `WALLET_ADDRESS` | - | Your Ergo wallet |
| `WORKER_NAME` | midas-gpu-server | Miner identifier |
| `GPU_DEVICES` | 0,1,2,3 | GPUs to use |
| `GPU_POWER_LIMIT` | 120W | Power per GPU |
| `GPU_TEMP_LIMIT` | 75°C | Operating temp |
| `ALGORITHM` | autolykos2 | Ergo mining |

### Safety Settings

| Parameter | Default | Description |
|-----------|---------|-------------|
| `EMERGENCY_TEMP` | 85°C | Emergency shutdown temp |
| `AUTO_SHUTDOWN_ON_OVERHEAT` | true | Auto-stop on overheat |
| `MAX_TEMP_BEFORE_RESTART` | 80°C | Restart threshold |
| `MIN_HASHRATE_THRESHOLD` | 300 MH/s | Minimum performance |

---

## 📊 Commands

### Miner Control

```bash
# Start mining
./scripts/miner_control.sh start

# Stop mining
./scripts/miner_control.sh stop

# Restart mining
./scripts/miner_control.sh restart

# Check status
./scripts/miner_control.sh status

# View logs
./scripts/miner_control.sh logs
```

### Health Monitoring

```bash
# Continuous monitoring
./monitoring/health_monitor.sh monitor

# One-time health check
./monitoring/health_monitor.sh check
```

---

## 🛠️ Installation (GPU Server)

### 1. Install TeamRedMiner

```bash
cd ~
wget https://github.com/todxx/teamredminer/releases/download/v0.10.21/teamredminer-v0.10.21-linux.tgz
tar xzf teamredminer-v0.10.21-linux.tgz
mv teamredminer-v0.10.21-linux teamredminer
```

### 2. Install ROCm Tools (for monitoring)

```bash
sudo apt-get install rocm-smi
```

### 3. Deploy Midas

```bash
git clone https://github.com/Vibhav-Aggarwal/Midas.git
cd Midas
chmod +x scripts/*.sh monitoring/*.sh
mkdir -p logs
```

### 4. Configure

```bash
# Edit configuration
nano config/mining.conf

# Update wallet address and pool
```

---

## 🔍 Monitoring & Metrics

### Logs

- **Miner logs:** `logs/miner.log`
- **Health logs:** `logs/midas_health.log`

### Metrics Endpoint

TeamRedMiner exposes Prometheus metrics on port 9100:
```bash
curl http://localhost:9100/metrics
```

Metrics include:
- Hashrate per GPU
- Temperature per GPU
- Power consumption
- Accepted/rejected shares

---

## 🚨 Safety Features

### Temperature Protection

1. **Operating Limit:** 75°C (configurable)
2. **Warning Limit:** 80°C (triggers restart)
3. **Emergency Limit:** 85°C (auto-shutdown)

### Auto-Recovery

- Automatic restart on miner crash
- GPU error detection
- Pool connection failover

---

## 📈 Performance Tuning

### Expected Performance

With 4x AMD RX 570 4GB GPUs:
- **Hashrate:** ~300 MH/s total (~75 MH/s per GPU)
- **Power:** ~480W total (~120W per GPU)
- **Efficiency:** ~0.625 MH/W

### Optimization Tips

1. **Core Clock:** 1150 MHz (balance speed/power)
2. **Memory Clock:** 2000 MHz (Ergo is memory-intensive)
3. **Power Limit:** 120W (efficiency sweet spot)
4. **Fan Curve:** 40-85% (keep temps under 75°C)

---

## 🔐 Security

- Store wallet address in `.env` file (not in git)
- Use read-only API keys when possible
- Monitor for unauthorized access
- Keep mining software updated

---

## 🆘 Troubleshooting

### Miner Won't Start

```bash
# Check if already running
./scripts/miner_control.sh status

# Check logs
tail -f logs/miner.log

# Verify GPU detection
rocm-smi
```

### Low Hashrate

- Check GPU clocks: `rocm-smi --showclocks`
- Verify power limit: `rocm-smi --showpower`
- Check pool connection in logs
- Ensure compute mode is enabled

### GPU Overheating

- Increase fan speed in `mining.conf`
- Reduce power limit
- Improve case ventilation
- Check thermal paste

---

## 🌐 Resources

### Mining Pools

- **Ergopool:** https://ergopool.io
- **Nanopool:** https://ergo.nanopool.org
- **Woolypooly:** https://woolypooly.com/en/coin/erg

### Profitability

- **WhatToMine:** https://whattomine.com
- **MiningPoolStats:** https://miningpoolstats.stream/ergo

### Documentation

- **TeamRedMiner:** https://github.com/todxx/teamredminer
- **Ergo:** https://ergoplatform.org
- **ROCm:** https://rocm.docs.amd.com

---

## 📝 Changelog

### v1.0.0 (2026-01-17)
- Initial project structure
- TeamRedMiner integration
- Health monitoring system
- Basic automation scripts
- Safety features

---

## 🤝 Contributing

Improvements welcome! Focus areas:
- Profitability switching
- Pool failover automation
- Advanced GPU tuning
- Grafana dashboards
- Alert integration

---

## 📄 License

MIT License - See LICENSE file for details

---

**Status:** 🟢 Active Development
**Deployment:** GPU Server (vibhav-gpu-server)
**Maintainer:** @Vibhav-Aggarwal
