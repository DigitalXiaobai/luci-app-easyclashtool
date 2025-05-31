#!/bin/sh

# 自动检测架构并下载对应 Clash.Meta 内核

TARGET_DIR="/usr/share/easyclashtool"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit 1

# 获取 OpenWrt 架构名称
ARCH_RAW=$(uname -m)

# 映射架构到 Clash.Meta 支持的二进制名称
case "$ARCH_RAW" in
  x86_64)
    ARCH="linux-amd64"
    ;;
  aarch64 | arm64)
    ARCH="linux-arm64"
    ;;
  armv7l | armv7 | armhf)
    ARCH="linux-armv7"
    ;;
  mipsel)
    ARCH="linux-mipsle-softfloat"
    ;;
  mips)
    ARCH="linux-mips-softfloat"
    ;;
  riscv64)
    ARCH="linux-riscv64"
    ;;
  *)
    echo "❌ 不支持的架构：$ARCH_RAW，请手动下载 Clash.Meta"
    exit 1
    ;;
esac

# 下载 Clash.Meta
URL="https://github.com/MetaCubeX/Clash.Meta/releases/latest/download/clash.meta-${ARCH}"

echo "➡ 正在为架构 $ARCH_RAW 下载 Clash.Meta ($ARCH)..."
curl -fsSL -o clash-meta "$URL"

if [ $? -eq 0 ]; then
    chmod +x clash-meta
    echo "✅ 下载成功，Clash.Meta 已就绪。"
else
    echo "❌ 下载失败，请检查网络或手动上传 Clash.Meta 内核。"
    exit 1
fi
