# Project Midas - AI Development Guide

**Cryptocurrency Mining Project**

This file helps Claude Code understand the project structure, conventions, and workflows for efficient development.

---

## 🎯 Project Overview

**Purpose:** Cryptocurrency mining operations and optimization
**Tech Stack:** TBD - Project in early stages
**Status:** Development - Needs setup
**Priority:** Low
**GitHub:** https://github.com/Vibhav-Aggarwal/Midas

---

## 📁 Project Structure

```
midas/
├── README.md             # Project documentation
└── CLAUDE.md            # This file
```

**Note:** Project is minimal - needs development

---

## 🔧 Development Environment

### Local Setup
```bash
cd ~/Projects/midas

# Check current state
ls -la

# Initialize if needed
git status
```

### Server Deployment
- **Location:** Not yet deployed to any server
- **Service:** TBD
- **Purpose:** Mining optimization, monitoring

---

## 🚀 Workflow for Claude Code

### Initial Development
```bash
# 1. Navigate to project
cd ~/Projects/midas

# 2. Understand requirements
# - What mining software? (TeamRedMiner, lolMiner, etc.)
# - What coins to mine? (Ergo, Ethereum, etc.)
# - What optimization needed?

# 3. Create initial structure
# - config/ for configurations
# - scripts/ for automation
# - monitoring/ for health checks

# 4. Commit changes
git add .
git commit -m "init: project structure"

# 5. Push to GitHub
git push origin main
```

---

## 💡 Potential Features

### Mining Operations
1. **Multi-GPU Management**
   - GPU selection and configuration
   - Power limit optimization
   - Temperature monitoring

2. **Profitability Switching**
   - Auto-switch between coins
   - Profit calculation
   - Pool selection

3. **Monitoring**
   - Hashrate tracking
   - GPU health monitoring
   - Alert system

4. **Automation**
   - Auto-restart on crash
   - Pool failover
   - Performance tuning

---

## 🎯 Next Steps

1. **Define Scope**
   - What problem are we solving?
   - What hardware will be used?
   - What's the goal?

2. **Research**
   - Best mining software for target
   - Optimal settings
   - Profitability analysis

3. **Setup Infrastructure**
   - Choose server (GPU server?)
   - Install dependencies
   - Configure monitoring

4. **Develop Core Features**
   - Mining automation
   - Health monitoring
   - Performance optimization

---

## 🔗 Useful Resources

### Mining Software
- TeamRedMiner (AMD)
- lolMiner (AMD/NVIDIA)
- T-Rex Miner (NVIDIA)

### Monitoring
- HiveOS
- Awesome Miner
- Custom Prometheus/Grafana

### Profitability
- WhatToMine.com
- NiceHash calculator
- MiningPoolStats

---

## 🤖 Claude Code Development Tips

1. **Start simple** - Get basic mining working first
2. **Monitor first** - Know what's happening
3. **Optimize later** - Stability before performance
4. **Document settings** - GPU configs, pool URLs
5. **Safety first** - Temperature limits, failsafes

---

## 📝 Code Standards

### Commit Messages
- `init:` - Initial setup
- `feat:` - New feature
- `config:` - Configuration changes
- `monitor:` - Monitoring improvements
- `docs:` - Documentation

### Best Practices
- Store sensitive data in .env
- Log all operations
- Handle crashes gracefully
- Monitor temperature/power
- Auto-restart on failure

---

## 📞 Quick Commands

```bash
# Start development
cd ~/Projects/midas

# Push to GitHub
git push origin main

# When ready to deploy (future)
~/Projects/.meta/deploy.sh deploy midas
```

---

## 🚧 Status: Under Development

This project needs:
- [ ] Requirements definition
- [ ] Architecture design
- [ ] Server selection
- [ ] Software setup
- [ ] Initial implementation
- [ ] Testing framework
- [ ] Monitoring system
- [ ] Documentation

---

**Last Updated:** 2026-01-17
**Maintained by:** Claude Code
**Status:** 🟡 Planning Phase
