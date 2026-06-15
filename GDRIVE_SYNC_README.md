# Google Drive Sync Setup Guide

This guide explains how to set up automatic syncing of your compiled CV and cover letters to Google Drive.

## Overview

When you push to GitHub, your compiled PDFs will automatically sync to your Google Drive folder:
**https://drive.google.com/drive/folders/1DdHzMrTlvyQfn3j9AEqU9O11s5zEKtDk**

## Quick Setup (One-time)

### Step 1: Install rclone

```bash
# Option A: Use the automated setup script
./scripts/setup_rclone.sh

# Option B: Manual installation
curl https://rclone.org/install.sh | sudo bash
rclone config
# Follow the prompts to configure Google Drive
```

### Step 2: Configure Google Drive

When running `rclone config`:
1. Select `n` for new remote
2. Name: `gdrive` ⭐ (This exact name is required)
3. Select `18` (Google Drive) or the number shown for Google Drive
4. Leave `client_id` blank (press Enter)
5. Leave `client_secret` blank (press Enter)
6. Scope: `1` (Full access)
7. Select `n` for advanced config
8. Select `y` for auto config (opens browser)
9. **Authenticate in your browser**
10. Select `n` for team drive
11. Select `q` to quit

### Step 3: Test the connection

```bash
rclone ls gdrive:
```

You should see your Google Drive files listed.

## Usage

### Manual Sync

```bash
# After compiling your CV
make sync

# Or directly
./scripts/sync_to_drive.sh
```

### Automatic Sync (on git push)

The git hooks are automatically installed when you run `make all`.

```bash
# Full workflow
make all              # Compile + install hooks
git add .
git commit -m "Update CV"
git push origin main  # Automatically syncs to Drive after push
```

## File Structure in Google Drive

```
📁 Your Drive/CV Folder/
├── 📄 OmarHaggagCV.pdf
└── 📁 cover_letters/
    ├── cover_letter_contract_cad.pdf
    ├── cover_letter_permit_cad.pdf
    ├── cover_letter_contract_ai.pdf
    ├── cover_letter_permit_ai.pdf
    ├── cover_letter_contract_power_electronics.pdf
    └── cover_letter_permit_power_electronics.pdf
```

## Troubleshooting

### "rclone 'gdrive' remote not configured"

Run the setup again:
```bash
rclone config
# Follow the steps in Step 2 above
```

### "Cannot connect to Google Drive"

Check your internet connection and re-authenticate:
```bash
rclone config
# Select 'e' to edit existing remote
# Select 'gdrive'
# Authenticate again
```

### Authentication expired

Google tokens expire after some time. Re-authenticate:
```bash
rclone config reconnect gdrive:
```

### Files not syncing

1. Check that PDFs were compiled:
   ```bash
   ls ~/personal/cv/root-CV/
   ```

2. Check rclone connection:
   ```bash
   rclone ls gdrive:
   ```

3. Run sync manually with verbose output:
   ```bash
   ./scripts/sync_to_drive.sh
   ```

## Security Notes

- Your Google Drive credentials are stored locally in `~/.config/rclone/`
- No credentials are stored in this repository
- The sync only uploads to your specified folder
- Existing files in Google Drive are overwritten (not duplicated)

## Files in This Setup

| File | Purpose |
|------|---------|
| `scripts/setup_rclone.sh` | Automated rclone installation and configuration |
| `scripts/sync_to_drive.sh` | Sync script that uploads PDFs to Drive |
| `scripts/install_hooks.sh` | Installs git hooks for automatic syncing |
| `.git/hooks/post-push` | Git hook that triggers sync after push |

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make all` | Compile CV, cover letters, and install hooks |
| `make sync` | Upload compiled PDFs to Google Drive |
| `make install-hooks` | Install git hooks only |

## Support

If you encounter issues:
1. Check rclone documentation: https://rclone.org/docs/
2. Verify your Google Drive folder ID: `1DdHzMrTlvyQfn3j9AEqU9O11s5zEKtDk`
3. Test connection: `rclone ls "gdrive:{\"1DdHzMrTlvyQfn3j9AEqU9O11s5zEKtDk\"}"`
