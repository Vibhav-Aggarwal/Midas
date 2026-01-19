# GPU Mining Guide - 4x RX 570 4GB Complete Reference

**Server**: gpu-server (10.0.0.71)
**Hardware**: 4x AMD RX 570 4GB (PowerColor Red Dragon)
**Driver**: amdgpu + Legacy OpenCL (PAL/ORCA)
**Status**: MINING ERGO @ ~3.3 MH/s
**Last Updated**: 2025-12-21

---

## Current Mining Status

| Metric | Value |
|--------|-------|
| Coin | Ergo (ERG) |
| Pool | erg.2miners.com |
| Hashrate | ~3.3 MH/s |
| GPUs | 4x active |
| Temps | 47-56°C |

**Dashboard**: https://erg.2miners.com/account/9f5SbawG2u5tx1wHQRiKktzkhgrhzZdeX9ws3q8osfP1cvPJL2m

---

## Active Wallet

**Ergo Address:**
```
9f5SbawG2u5tx1wHQRiKktzkhgrhzZdeX9ws3q8osfP1cvPJL2m
```

See `WALLETS.md` for full wallet details and seed phrases.

---

## Quick Commands

```bash
# SSH to GPU server (direct tunnel)
ssh gpu-server-remote

# Switch coins
~/mining/scripts/switch-coin.sh ergo
~/mining/scripts/switch-coin.sh vertcoin
~/mining/scripts/switch-coin.sh neoxa
~/mining/scripts/switch-coin.sh neurai

# Check status
~/mining/scripts/switch-coin.sh status
systemctl status gpu-miner

# View live logs
journalctl -u gpu-miner -f

# Restart mining
sudo systemctl restart gpu-miner
```

---

## 4GB VRAM Compatible Coins

### CONFIRMED WORKING

| Coin | Algorithm | DAG/VRAM | Hashrate | Status |
|------|-----------|----------|----------|--------|
| **Ergo (ERG)** | autolykos2 | ~1.3 GB | ~3.3 MH/s | **MINING NOW** |
| **Vertcoin (VTC)** | verthash | 2 GB fixed | ~1.5 MH/s | Ready |
| **Neoxa (NEOX)** | kawpow | <4 GB | TBD | Ready (until 2027) |
| **Neurai (XNA)** | kawpow | <4 GB | TBD | Ready (until 2029) |

### NOT WORKING (DAG > 4GB)

| Coin | DAG Size | Status |
|------|----------|--------|
| ETC | 4.1 GB | Over limit |
| RVN | 5.3 GB | Way over |
| Kaspa | N/A | Driver hangs |

---

## Stability Fixes Applied

### Kernel Parameters
```
amdgpu.dc=0 amdgpu.runpm=0 amdgpu.aspm=0 amdgpu.dcdebugmask=0x10
```

### Environment Variables
```bash
export AMD_DEBUG="nongg"
export GPU_MAX_HEAP_SIZE=100
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_USE_SYNC_OBJECTS=1
```

These fixes prevent kworker/TTM processes from hanging.

---

## Server Access

| Method | Command |
|--------|---------|
| Direct SSH | `ssh gpu-server-remote` |
| Via Office | `ssh gpu-server-jump` |
| Local | `ssh vibhavaggarwal@10.0.0.71` |
| MCP Health | `curl https://mcp-gpu.vibhavaggarwal.com/health` |
| Wake-on-LAN | `ssh office-server "wakeonlan 00:e0:0d:00:b3:c5"` |

---

## File Locations

| File | Path |
|------|------|
| Mining Scripts | `~/mining/scripts/` |
| Coin Switcher | `~/mining/scripts/switch-coin.sh` |
| Wallet Info | `~/wallets/` |
| TeamRedMiner | `~/mining/teamredminer/` |
| Systemd Service | `/etc/systemd/system/gpu-miner.service` |
| Health Monitor | `/etc/systemd/system/gpu-health-monitor.service` |

---

## Profitability (Dec 2025)

| Coin | Daily Earnings | Notes |
|------|----------------|-------|
| Ergo | ~$0.05-0.10 | Best current option |
| Vertcoin | ~$0.03-0.08 | No DAG growth |

**Note**: Electricity costs likely exceed earnings. Mining mainly for accumulation/hobby.

---

## Sources
- [2miners Ergo](https://erg.2miners.com)
- [WhatToMine RX 570](https://whattomine.com/gpus/49-amd-rx-570-4gb)
- [TeamRedMiner](https://github.com/todxx/teamredminer)
