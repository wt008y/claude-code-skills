# Claude Code Skills Installer (PowerShell)
# 用法: .\install.ps1

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsSource = Join-Path $ScriptDir ".agents" "skills"

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Claude Code 设计技能包 - 自动安装" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Check Node.js
try {
    $nodeVersion = node --version
    Write-Host "[OK] Node.js: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "[错误] 未检测到 Node.js，请先安装：https://nodejs.org" -ForegroundColor Red
    Read-Host "按回车键退出"
    exit 1
}

# Check npm
try {
    $npmVersion = npm --version
    Write-Host "[OK] npm: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "[错误] 未检测到 npm" -ForegroundColor Red
    Read-Host "按回车键退出"
    exit 1
}

Write-Host ""

# Ask whether to set npm mirror
$setMirror = Read-Host "是否设置 npm 淘宝镜像？(y/n, 默认 n)"
if ($setMirror -eq "y") {
    npm config set registry https://registry.npmmirror.com
    Write-Host "[OK] npm 镜像已设置为 npmmirror.com" -ForegroundColor Green
}

# Local copy fallback function
function Copy-LocalSkill {
    param([string]$Name)
    $src = Join-Path $SkillsSource $Name
    $dst = Join-Path (Get-Location) ".agents" "skills" $Name
    if (Test-Path $src) {
        New-Item -ItemType Directory -Force -Path $dst | Out-Null
        Copy-Item -Recurse -Force "$src\*" "$dst\"
        return $true
    }
    return $false
}

Write-Host ""
Write-Host "===== 开始安装技能 =====" -ForegroundColor Yellow
Write-Host ""

$skills = @(
    @{Name="frontend-design"; Source="anthropics/skills@frontend-design"},
    @{Name="ui-ux-pro-max"; Source=""; LocalOnly=$true},
    @{Name="baseline-ui"; Source="ibelick/ui-skills@baseline-ui"},
    @{Name="fixing-accessibility"; Source="ibelick/ui-skills@fixing-accessibility"},
    @{Name="fixing-metadata"; Source="ibelick/ui-skills@fixing-metadata"},
    @{Name="fixing-motion-performance"; Source="ibelick/ui-skills@fixing-motion-performance"}
)

$count = 1
foreach ($skill in $skills) {
    Write-Host "[$count/$($skills.Count)] 安装 $($skill.Name)..." -ForegroundColor Yellow

    if ($skill.LocalOnly) {
        # Local-only skill (ui-ux-pro-max)
        if (Copy-LocalSkill $skill.Name) {
            Write-Host "[OK] $($skill.Name) 已从本地复制" -ForegroundColor Green
        } else {
            Write-Host "[警告] 未找到 $($skill.Name) 本地文件" -ForegroundColor Red
        }
    } else {
        # Try npx install first, fallback to local copy
        npx skills add $skill.Source
        if ($LASTEXITCODE -ne 0) {
            Write-Host "[警告] $($skill.Name) 在线安装失败，尝试本地复制..." -ForegroundColor Yellow
            if (Copy-LocalSkill $skill.Name) {
                Write-Host "[OK] $($skill.Name) 已从本地复制" -ForegroundColor Green
            } else {
                Write-Host "[警告] $($skill.Name) 安装失败" -ForegroundColor Red
            }
        } else {
            Write-Host "[OK] $($skill.Name) 安装成功" -ForegroundColor Green
        }
    }
    Write-Host ""
    $count++
}

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  安装完成！" -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "  使用流程: frontend-design → baseline-ui" -ForegroundColor Cyan
Write-Host "           → fixing-accessibility → fixing-motion-performance" -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "  提示：别忘了把 CLAUDE.md 复制到项目根目录" -ForegroundColor Yellow
Write-Host "============================================" -ForegroundColor Cyan

Read-Host "按回车键退出"
