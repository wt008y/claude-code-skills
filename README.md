# Claude Code 设计技能包

适用于 Claude Code 的 6 个前端设计技能，遵循官方 Frontend Design + UI/UX Pro Max 设计规范。

## 📦 仓库结构

```
claude-code-skills/
├── CLAUDE.md              ← Claude Code 自动加载的指令（复制到项目根目录）
├── .agents/
│   └── skills/            ← 6个设计技能（复制到项目根目录）
├── README.md              ← 本文件
├── install.bat            ← Windows 安装脚本
└── install.ps1            ← PowerShell 安装脚本
```

## 🚀 新电脑一键配置

### 前置条件
- **Node.js >= 18** → 下载 https://nodejs.org（选 LTS 版本）
- **Claude Code** → VS Code 扩展或 `npm install -g @anthropic-ai/claude-code`

### 步骤

```bash
# 1. 克隆仓库到任意位置
git clone https://github.com/wt008y/claude-code-skills.git

# 2. 将 CLAUDE.md 复制到你的项目根目录
cp claude-code-skills/CLAUDE.md 你的项目目录/

# 3. 将 skills 复制到你的项目根目录
cp -r claude-code-skills/.agents 你的项目目录/

# 4. 安装在线依赖（可选，用于在线更新技能）
cd claude-code-skills
install.bat
```

**完成！** 在项目目录中打开 Claude Code，即可使用 `/frontend-design` 等所有技能。

### 一句话搞定（Windows PowerShell）

```powershell
git clone https://github.com/wt008y/claude-code-skills.git && cd claude-code-skills && .\install.ps1
```

## 包含的技能

| 技能 | 来源 | 用途 |
|------|------|------|
| **frontend-design** | anthropics/skills 官方 | 确立美学方向，生成高水准前端界面 |
| **ui-ux-pro-max** | 社区 | 67种UI风格、161配色方案、57字体配对 |
| **baseline-ui** | ibelick/ui-skills | 清除AI式间距，改善排版节奏 |
| **fixing-accessibility** | ibelick/ui-skills | 键盘导航、标签、焦点管理、语义化HTML |
| **fixing-metadata** | ibelick/ui-skills | SEO元数据、社交分享标签 |
| **fixing-motion-performance** | ibelick/ui-skills | 性能优先的动效设计 |

## 设计工作链

推荐的调用顺序：

```
frontend-design → baseline-ui → fixing-accessibility → fixing-motion-performance
```

1. **frontend-design** — 确立美学方向（字体、色彩、构图、动效）
2. **baseline-ui** — 调细节（间距、组件状态）
3. **fixing-accessibility** — 修无障碍（WCAG 2.1 AA）
4. **fixing-motion-performance** — 加动效（性能优先）

## 设计规则速查

- **禁用字体**: Inter, Roboto, Arial, Helvetica, system-ui, Open Sans, Lato
- **推荐字体**: Clash Display, Cabinet Grotesk, Satoshi, Syne, Noto Serif SC 等
- **禁用模式**: 紫粉蓝渐变、左边框卡片、emoji替代图标、虚假统计数据
- **推荐色彩**: OKLCH 色彩空间（`oklch(0.55 0.25 250)`）
- **可访问性**: 对比度 ≥ 4.5:1，触摸区域 ≥ 44px
- **动效**: transform + opacity 优先，150-300ms，prefers-reduced-motion
