# Claude Code 设计技能包

本仓库提供 Claude Code 前端设计技能及使用指南。将此文件置于项目根目录，Claude Code 将自动加载以下配置。

## 可用技能（6个）

位于 `.agents/skills/` 目录，可直接通过 `/` 命令调用：

| 技能 | 调用方式 | 功能 |
|------|----------|------|
| **frontend-design** | `/frontend-design` | 确立美学方向，生成高水准前端界面 |
| **ui-ux-pro-max** | `/ui-ux-pro-max` | 67种UI风格、161配色方案、57字体配对 |
| **baseline-ui** | `/baseline-ui` | 清除AI式间距，改善排版节奏 |
| **fixing-accessibility** | `/fixing-accessibility` | 键盘导航、标签、焦点管理、语义化HTML |
| **fixing-metadata** | `/fixing-metadata` | SEO元数据、社交分享标签 |
| **fixing-motion-performance** | `/fixing-motion-performance` | 性能优先的动效设计 |

## 设计工作链

推荐的调用顺序：
```
frontend-design → baseline-ui → fixing-accessibility → fixing-motion-performance
```

1. **frontend-design** — 先确立大胆的美学方向（字体、色彩、构图、动效）
2. **baseline-ui** — 再调细节（间距、组件状态、交互反馈）
3. **fixing-accessibility** — 然后修无障碍（WCAG 2.1 AA 合规）
4. **fixing-motion-performance** — 最后加动效（性能优先，transform/opacity）

## 设计规则速查

### 禁用
- **字体**: Inter, Roboto, Arial, Helvetica, system-ui, Open Sans, Lato
- **模式**: 紫粉蓝渐变、左边框卡片、emoji替代图标、虚假统计数据/评价/Logo墙
- **色彩**: 纯黑/纯灰无色调变化、渐变文字、深色模式发光强调色
- **动效**: bounce/elastic 缓动曲线、width/height/padding动画

### 推荐
- **字体**: Clash Display, Cabinet Grotesk, Satoshi, Syne, Noto Serif SC, Noto Sans SC
- **色彩空间**: OKLCH（如 `oklch(0.55 0.25 250)`）
- **动效**: transform + opacity 优先，150-300ms，prefers-reduced-motion
- **可访问性**: 对比度 ≥ 4.5:1，触摸区域 ≥ 44px，焦点状态可见

## 新电脑配置

在新电脑上使用此技能包：
```
git clone https://github.com/wt008y/claude-code-skills.git
```
然后将 `CLAUDE.md` 复制到你的项目根目录，将 `.agents/` 复制到项目根目录即可。
