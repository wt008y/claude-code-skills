# Claude Code 设计技能包

适用于 Claude Code 的 6 个前端设计技能 + 完整配置备份/恢复。

## 仓库结构

```
claude-code-skills/
├── CLAUDE.md              ← 设计规范（复制到项目根目录）
├── .agents/skills/        ← 6个设计技能
├── config/
│   ├── settings.template.json  ← Claude Code 配置模板
│   └── memory/                 ← 长期记忆备份
├── install.ps1            ← 一键恢复脚本
├── install.bat
└── README.md
```

## 新电脑一键恢复

```powershell
git clone https://github.com/wt008y/claude-code-skills.git
cd claude-code-skills
.\install.ps1
```

install.ps1 会自动：
1. 安装 6 个技能到全局 (`~/.claude/.agents/skills/`)
2. 创建 settings.json（提示输入 API Key）
3. 恢复长期记忆
4. 复制 CLAUDE.md 到当前项目

## 技能列表

| 技能 | 调用 | 功能 |
|------|------|------|
| frontend-design | `/frontend-design` | 确立美学方向，生成高水准前端界面 |
| ui-ux-pro-max | `/ui-ux-pro-max` | 67种UI风格、161配色、57字体配对 |
| baseline-ui | `/baseline-ui` | 清除AI式间距，改善排版节奏 |
| fixing-accessibility | `/fixing-accessibility` | 键盘导航、焦点管理、语义化HTML |
| fixing-metadata | `/fixing-metadata` | SEO元数据、社交分享标签 |
| fixing-motion-performance | `/fixing-motion-performance` | 性能优先的动效设计 |

## 设计工作链

```
frontend-design → baseline-ui → fixing-accessibility → fixing-motion-performance
```

## 手动安装

如果不运行 install.ps1，手动执行：

```
cp CLAUDE.md 项目目录/
cp -r .agents 项目目录/.agents
```

全局安装（所有项目可用）：

```
cp -r .agents ~/.claude/.agents
```
