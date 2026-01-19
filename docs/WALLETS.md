# GPU Mining Wallets

**Generated:** 2025-12-21
**Server:** gpu-server (4x AMD RX 570 4GB)
**Status:** Mining Ergo @ ~3.3 MH/s

---

## ERGO (ERG) - CURRENTLY MINING

**Address:**
```
9f5SbawG2u5tx1wHQRiKktzkhgrhzZdeX9ws3q8osfP1cvPJL2m
```

**Pool:** erg.2miners.com:8888

**Dashboard:** https://erg.2miners.com/account/9f5SbawG2u5tx1wHQRiKktzkhgrhzZdeX9ws3q8osfP1cvPJL2m

**SEED PHRASE (24 words) - BACKUP SECURELY!**
```
coin such sail tower habit insane barely observe
mosquito impose kind expire decide name owner police
robust trigger squirrel crunch provide august royal pattern
```

**Private Key:**
```
760f1913b49a9ffcbf7f1d597c6ead756982147966fc30e7dcd70284bdcd634d
```

---

## VERTCOIN (VTC)

**Address:**
```
vtc1q79y553qwywl8v6qe7p03gh62pafv37qys8avch
```

**Pool:** vtc.2miners.com:4534

**Dashboard:** https://vtc.2miners.com/account/vtc1q79y553qwywl8v6qe7p03gh62pafv37qys8avch

---

## NEOXA (NEOX)

**Address:**
```
GWrUaA3MKE2zftunarN9JaQBW5PmqEgKwP
```

**Pool:** stratum.rplant.xyz:17049

---

## NEURAI (XNA)

**Address:**
```
NT8L9M52SH3SSSe4Rd3mkJoDuSpgy8xf6S
```

**Pool:** stratum.rplant.xyz:17063

---

## Quick Commands

```bash
# SSH to GPU server
ssh gpu-server-remote

# Switch coins
~/mining/scripts/switch-coin.sh ergo
~/mining/scripts/switch-coin.sh vertcoin
~/mining/scripts/switch-coin.sh neoxa
~/mining/scripts/switch-coin.sh neurai

# Check status
~/mining/scripts/switch-coin.sh status

# View logs
journalctl -u gpu-miner -f
```

---

## Server Files

| File | Location |
|------|----------|
| Wallet Summary | `~/wallets/WALLET_SUMMARY.txt` |
| Ergo Wallet JSON | `~/wallets/ergo_wallet.json` |
| Mining Scripts | `~/mining/scripts/` |
| Coin Switcher | `~/mining/scripts/switch-coin.sh` |

---

## SECURITY WARNING

- **NEVER share your seed phrase or private keys**
- **Anyone with the seed phrase can steal your funds**
- **Backup this file securely (encrypted USB, paper wallet)**
- **Delete from cloud storage after backing up locally**
