#!/usr/bin/env bash
set -e

TARGET_DIR="$HOME/.gemini/config/skills/digital-twin-avatar-sheet-architect"

echo "=========================================================="
echo " 安裝全域技能：digital-twin-avatar-sheet-architect"
echo "=========================================================="

if [ -d "$TARGET_DIR" ]; then
    echo "偵測到已存在目標目錄，正在進行更新 (git pull)..."
    git -C "$TARGET_DIR" pull
else
    echo "正在 Clone 儲存庫至全域技能目錄..."
    mkdir -p "$(dirname "$TARGET_DIR")"
    git clone https://github.com/JeffreyHo0520/digital-twin-avatar-sheet-architect.git "$TARGET_DIR"
fi

echo ""
echo "✅ 安裝完成！"
echo "技能路徑：$TARGET_DIR"
echo "您現在可以在 Antigravity 或 Gemini Agent 中隨時使用此技能！"
