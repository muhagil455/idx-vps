#!/bin/bash
# Fix storage besar Project IDX

sudo mkdir -p /mnt/storage/var/cache/apt /mnt/storage/var/lib/apt/lists /mnt/storage/var/cache /mnt/storage/var/log /mnt/storage/root-cache /mnt/storage/user-cache

# Pindah data kalau ada
sudo rsync -aP /var/cache/apt/ /mnt/storage/var/cache/apt/ 2>/dev/null || true
sudo rsync -aP /var/lib/apt/lists/ /mnt/storage/var/lib/apt/lists/ 2>/dev/null || true
sudo rsync -aP /var/cache/ /mnt/storage/var/cache/ 2>/dev/null || true
sudo rsync -aP /var/log/ /mnt/storage/var/log/ 2>/dev/null || true
sudo rsync -aP /root/.cache/ /mnt/storage/root-cache/ 2>/dev/null || true
rsync -aP \~/.cache/ /mnt/storage/user-cache/ 2>/dev/null || true

# Hapus & buat symlink
sudo rm -rf /var/cache/apt /var/lib/apt/lists /var/cache /var/log /root/.cache \~/.cache

sudo ln -sf /mnt/storage/var/cache/apt /var/cache/apt
sudo ln -sf /mnt/storage/var/lib/apt/lists /var/lib/apt/lists
sudo ln -sf /mnt/storage/var/cache /var/cache
sudo ln -sf /mnt/storage/var/log /var/log
sudo ln -sf /mnt/storage/root-cache /root/.cache
ln -sf /mnt/storage/user-cache \~/.cache

sudo chown -R root:root /mnt/storage/var /mnt/storage/root-cache /mnt/storage/user-cache
sudo chmod -R 755 /mnt/storage/var /mnt/storage/root-cache /mnt/storage/user-cache
