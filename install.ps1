# Claude Code 完整配置安装器
# 用法: .\install.ps1 [-ProjectPath <path>] [-SkipSkills]

param(
    [string]$ProjectPath = (Get-Location).Path,
    [switch]$SkipSkills
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsSource = Join-Path $ScriptDir ".agents" "skills"
$ConfigDir = Join-Path $ScriptDir "config"
$UserClaude = Join-Path $env:USERPROFILE ".claude"

Write-Host "===== Claude Code 配置安装 =====" -ForegroundColor Cyan

# 1. 检测 Node.js
try { $null = node --version } catch {
    Write-Host "[错误] Node.js 未安装: https://nodejs.org" -ForegroundColor Red
    exit 1
}
Write-Host "[OK] Node.js $(node --version)" -ForegroundColor Green

# 2. npm 镜像
$setMirror = Read-Host "设置 npm 淘宝镜像？(y/n)"
if ($setMirror -eq "y") {
    npm config set registry https://registry.npmmirror.com
    Write-Host "[OK] 镜像已设置" -ForegroundColor Green
}

# 3. 创建目录
$null = New-Item -ItemType Directory -Force -Path (Join-Path $UserClaude ".agents" "skills")
$null = New-Item -ItemType Directory -Force -Path (Join-Path $ProjectPath ".agents" "skills")
$null = New-Item -ItemType Directory -Force -Path (Join-Path $UserClaude "projects" "e--AI--" "memory")

# 4. 安装技能到用户级（全局）
if (-not $SkipSkills) {
    Write-Host "===== 安装技能 =====" -ForegroundColor Yellow
    $skills = Get-ChildItem $SkillsSource -Directory
    foreach ($skill in $skills) {
        $dst = Join-Path $UserClaude ".agents" "skills" $skill.Name
        Copy-Item -Recurse -Force "$($skill.FullName)\*" "$dst\"
        Write-Host "[OK] $($skill.Name)" -ForegroundColor Green
    }
}

# 5. 项目级技能（可选，如果项目路径不同于脚本目录）
if ($ProjectPath -ne $ScriptDir) {
    Copy-Item -Recurse -Force "$SkillsSource\*" (Join-Path $ProjectPath ".agents" "skills") -ErrorAction SilentlyContinue
}

# 6. settings.json
$userSettings = Join-Path $UserClaude "settings.json"
if (Test-Path $userSettings) {
    Write-Host "[跳过] settings.json 已存在" -ForegroundColor Yellow
} else {
    $apiKey = Read-Host "输入 API Key (回车跳过)"
    $template = Get-Content (Join-Path $ConfigDir "settings.template.json") -Raw
    $template = $template -replace "YOUR_API_KEY_HERE", $apiKey
    Set-Content -Path $userSettings -Value $template -Encoding utf8
    Write-Host "[OK] settings.json 已创建" -ForegroundColor Green
}

# 7. 记忆文件
Copy-Item (Join-Path $ConfigDir "memory" "*") (Join-Path $UserClaude "projects" "e--AI--" "memory") -Force
Write-Host "[OK] 记忆文件已恢复" -ForegroundColor Green

# 8. CLAUDE.md 到项目
$claudeSrc = Join-Path $ScriptDir "CLAUDE.md"
$claudeDst = Join-Path $ProjectPath "CLAUDE.md"
if (-not (Test-Path $claudeDst)) {
    Copy-Item $claudeSrc $claudeDst
    Write-Host "[OK] CLAUDE.md -> 项目" -ForegroundColor Green
} else {
    Write-Host "[跳过] CLAUDE.md 已存在" -ForegroundColor Yellow
}

Write-Host "===== 安装完成 =====" -ForegroundColor Cyan
Write-Host "技能: /frontend-design, /baseline-ui, /fixing-accessibility, /fixing-metadata, /fixing-motion-performance, /ui-ux-pro-max"
