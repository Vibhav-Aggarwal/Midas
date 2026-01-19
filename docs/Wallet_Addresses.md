# Mining Wallet Addresses

**Last Updated:** 2025-12-21
**Status:** Mining Ergo @ ~3.3 MH/s

---

## ACTIVE: Ergo (ERG)

| Property | Value |
|----------|-------|
| **Address** | `9f5SbawG2u5tx1wHQRiKktzkhgrhzZdeX9ws3q8osfP1cvPJL2m` |
| **Pool** | erg.2miners.com:8888 |
| **Dashboard** | https://erg.2miners.com/account/9f5SbawG2u5tx1wHQRiKktzkhgrhzZdeX9ws3q8osfP1cvPJL2m |
| **Status** | **MINING NOW** |

**Seed Phrase:**
```
coin such sail tower habit insane barely observe
mosquito impose kind expire decide name owner police
robust trigger squirrel crunch provide august royal pattern
```

**Private Key:** `760f1913b49a9ffcbf7f1d597c6ead756982147966fc30e7dcd70284bdcd634d`

---

## READY: Vertcoin (VTC)

| Property | Value |
|----------|-------|
| **Address** | `vtc1q79y553qwywl8v6qe7p03gh62pafv37qys8avch` |
| **Pool** | vtc.2miners.com:4534 |
| **Dashboard** | https://vtc.2miners.com/account/vtc1q79y553qwywl8v6qe7p03gh62pafv37qys8avch |
| **Status** | Ready |

---

## READY: Neoxa (NEOX)

| Property | Value |
|----------|-------|
| **Address** | `GWrUaA3MKE2zftunarN9JaQBW5PmqEgKwP` |
| **Pool** | stratum.rplant.xyz:17049 |
| **Status** | Ready (needs verification) |

---

## READY: Neurai (XNA)

| Property | Value |
|----------|-------|
| **Address** | `NT8L9M52SH3SSSe4Rd3mkJoDuSpgy8xf6S` |
| **Pool** | stratum.rplant.xyz:17063 |
| **Status** | Ready (needs verification) |

---

## Legacy Wallets (ETC/ETH - For Future 6GB+ GPUs)

| Property | Value |
|----------|-------|
| **Address** | `0x2E4fD2Fe52C7aE967978826f2c443d0c1fC48437` |
| **Private Key** | `0x0ce5f7171ac59180ec58ab36fd3cf038f3ceeecc17514318fbe36a58bf23cff8` |

---

## Quick Commands

```bash
# SSH to GPU server
ssh gpu-server-remote

# Switch coins
~/mining/scripts/switch-coin.sh ergo      # Current
~/mining/scripts/switch-coin.sh vertcoin
~/mining/scripts/switch-coin.sh neoxa
~/mining/scripts/switch-coin.sh neurai

# Check status
~/mining/scripts/switch-coin.sh status
```

---

## Security Notes

1. **NEVER share** seed phrases or private keys
2. **Backup** in multiple secure locations (encrypted USB, paper)
3. Anyone with seed phrase can **steal all funds**
4. These are **hot wallets** - only keep mining earnings
5. Consider hardware wallet for large amounts
