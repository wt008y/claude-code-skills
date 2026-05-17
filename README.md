# Claude Code 设计技能包

适用于 Claude Code 的 6 个前端设计技能，遵循官方 Frontend Design + UI/UX Pro Max 设计规范。

## 包含的技能

| 技能 | 来源 | 用途 |
|------|------|------|
| **frontend-design** | anthropics/skills | 官方前端设计技能，确立美学方向 |
| **ui-ux-pro-max** | 社区 | 67种UI风格、161配色方案、57字体配对 |
| **baseline-ui** | ibelick/ui-skills | 清除AI式间距，改善排版节奏 |
| **fixing-accessibility** | ibelick/ui-skills | 键盘导航、标签、焦点管理、语义化HTML |
| **fixing-metadata** | ibelick/ui-skills | SEO元数据、社交分享标签 |
| **fixing-motion-performance** | ibelick/ui-skills | 性能优先的动效设计 |

## 前置条件

1. **Node.js >= 18**（推荐 v22 LTS）
   - 下载：https://nodejs.org （选择 LTS 版本）
   - 安装后验证：`node --version && npm --version`

2. **Claude Code CLI**
   - 在 VS Code 中安装 Claude Code 扩展
   - 或通过 `npm install -g @anthropic-ai/claude-code` 安装 CLI

3. **网络访问**
   - 安装时需要访问 npm registry（registry.npmjs.org）
   - 如果在中国大陆，建议设置 npm 镜像：
     ```
     npm config set registry https://registry.npmmirror.com
     ```

## 安装方式

### 方式一：自动安装（推荐）

**Windows（双击运行）：**
```
install.bat
```

**Windows PowerShell：**
```powershell
.\install.ps1
```

### 方式二：手动安装

```bash
# 1. 进入 Claude Code 工作目录
cd 你的项目目录

# 2. 逐个安装技能

# Frontend Design（官方）
npx skills add anthropics/skills@frontend-design

# UI/UX Pro Max（社区）
npx skills add npx skills add https://github.com/WT008/skills.git@ui-ux-pro-max

# ibelick/ui-skills 系列
npx skills add ibelick/ui-skills@baseline-ui
npx skills add ibelick/ui-skills@fixing-accessibility
npx skills add ibelick/ui-skills@fixing-metadata
npx skills add ibelick/ui-skills@fixing-motion-performance

# 3. 验证安装
ls .agents/skills/
```

### 方式三：离线安装

如果电脑无法访问网络，可以将本仓库的 `skills/` 目录直接复制到项目的 `.agents/skills/` 目录：

```bash
# 在项目根目录执行
mkdir -p .agents/skills
cp -r 本仓库路径/skills/* .agents/skills/
```

## 使用流程（设计工作链）

推荐的技能调用顺序：

```
frontend-design → baseline-ui → fixing-accessibility → fixing-motion-performance
```

1. **frontend-design** — 确立美学方向（字体、色彩、构图、动效）
2. **baseline-ui** — 调细节（间距、组件状态）
3. **fixing-accessibility** — 修无障碍（WCAG 2.1 AA）
4. **fixing-motion-performance** — 加动效（性能优先）

## 设计规则参考

详细设计规则已保存至长期记忆。关键原则：

- **禁用字体**: Inter, Roboto, Arial, Helvetica, system-ui, Open Sans, Lato
- **推荐字体**: Clash Display, Cabinet Grotesk, Satoshi, Syne, Noto Serif SC 等
- **禁用模式**: 紫粉蓝渐变、左边框卡片、emoji替代图标、虚假统计数据
- **推荐色彩**: OKLCH 色彩空间，感知均匀的色值
- **可访问性**: 对比度 ≥ 4.5:1，触摸区域 ≥ 44px
