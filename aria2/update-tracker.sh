#!/bin/bash
# 从 trackerslist.com 拉取最新 tracker 列表并更新 aria2.conf
CONF="$HOME/.config/aria2/aria2.conf"
TMP=$(mktemp)
URL="https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt"

echo "[$(date)] 开始更新 tracker 列表..."

# 下载最新 tracker 列表，取前 25 个，去掉空行和注释
TRACKERS=$(curl -fsSL --connect-timeout 10 "$URL" 2>/dev/null | grep -v '^#' | grep -v '^$' | head -25 | paste -sd ',' -)

if [ -z "$TRACKERS" ]; then
    echo "[$(date)] 下载失败，跳过更新"
    rm "$TMP"
    exit 0
fi

# 替换 bt-tracker 行
sed -i '' "/^bt-tracker=/s|=.*|=$TRACKERS|" "$CONF"

echo "[$(date)] 已更新 tracker 列表（$(echo "$TRACKERS" | tr ',' '\n' | wc -l | tr -d ' ') 个）"

# 如果 aria2 在运行，通知它重新加载
if pgrep aria2c > /dev/null; then
    kill -HUP $(pgrep aria2c) 2>/dev/null || true
    echo "[$(date)] 已发送 SIGHUP 通知 aria2"
fi
