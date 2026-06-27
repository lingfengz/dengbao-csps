#!/bin/bash
#
# 等保测评 AI Agent Skill 集合 — 一键安装到 Hermes Agent
#
# 用法:
#   bash install.sh              # 安装到默认 profile
#   bash install.sh myprofile    # 安装到指定 profile
#

set -e

PROFILE="${1:-default}"
HERMES_SKILLS_DIR="${HOME}/.hermes/profiles/${PROFILE}/skills"
TARGET_DIR="${HERMES_SKILLS_DIR}/dengbao-DJCP"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "📦 等保测评 Skill 集合安装工具"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "源目录: ${SOURCE_DIR}/skills"
echo "目标目录: ${TARGET_DIR}"
echo "Profile: ${PROFILE}"
echo ""

# 检查源目录
if [ ! -d "${SOURCE_DIR}/skills" ]; then
    echo "❌ 错误: 找不到 skills/ 目录"
    echo "   请确保在 dengbao-DJCP 项目根目录下运行此脚本"
    exit 1
fi

# 创建目标目录
mkdir -p "${TARGET_DIR}"

# 复制文件
echo "📄 复制 skill 文件..."
cp -r "${SOURCE_DIR}/skills/"* "${TARGET_DIR}/"

# 删除 archive 目录（已合并的文件不安装）
rm -rf "${TARGET_DIR}/archive"

# 统计安装的文件数量
FILE_COUNT=$(find "${TARGET_DIR}" -name "*.md" -type f | wc -l | tr -d ' ')

echo ""
echo "✅ 安装完成！"
echo "   共 ${FILE_COUNT} 个 skill 文件"
echo "   安装位置: ${TARGET_DIR}"
echo ""
echo "🔄 注意: 新技能将在 Hermes 下次启动时生效"
echo "   如需立即使用，请重启 Hermes Agent"
echo ""
echo "📖 使用指南: 见 ${SOURCE_DIR}/README.md"
