@echo off
chcp 65001 >nul
title Claude Code 技能安装向导

echo ============================================
echo   Claude Code 设计技能包 - 自动安装
echo ============================================
echo.

:: Check Node.js
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未检测到 Node.js，请先安装：https://nodejs.org
    echo.
    pause
    exit /b 1
)
echo [OK] Node.js:
node --version

:: Check npm
where npm >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未检测到 npm
    pause
    exit /b 1
)
echo [OK] npm:
npm --version
echo.

:: Ask whether to set npm mirror
set /p SET_MIRROR="是否设置 npm 淘宝镜像？(y/n, 默认 n): "
if /i "%SET_MIRROR%"=="y" (
    call npm config set registry https://registry.npmmirror.com
    echo [OK] npm 镜像已设置为 npmmirror.com
)

echo.
echo ===== 开始安装技能 =====
echo.

:: 1. frontend-design
echo [1/6] 安装 frontend-design（官方）
call npx skills add anthropics/skills@frontend-design
if %ERRORLEVEL% NEQ 0 (
    echo [警告] frontend-design 安装失败
) else (
    echo [OK] frontend-design 安装成功
)
echo.

:: 2. ui-ux-pro-max
echo [2/6] 安装 ui-ux-pro-max（社区）
call npx skills add ibelick/ui-skills@ui-ux-pro-max 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [提示] 在线安装失败，尝试从本地复制...
    if exist "%~dp0skills\ui-ux-pro-max" (
        xcopy /E /I /Y "%~dp0skills\ui-ux-pro-max" ".agents\skills\ui-ux-pro-max"
        echo [OK] ui-ux-pro-max 已从本地复制
    ) else (
        echo [警告] 未找到 ui-ux-pro-max 本地文件，请手动安装
    )
)
echo.

:: 3. baseline-ui
echo [3/6] 安装 baseline-ui
call npx skills add ibelick/ui-skills@baseline-ui
if %ERRORLEVEL% NEQ 0 (
    echo [警告] baseline-ui 安装失败
) else (
    echo [OK] baseline-ui 安装成功
)
echo.

:: 4. fixing-accessibility
echo [4/6] 安装 fixing-accessibility
call npx skills add ibelick/ui-skills@fixing-accessibility
if %ERRORLEVEL% NEQ 0 (
    echo [警告] fixing-accessibility 安装失败
) else (
    echo [OK] fixing-accessibility 安装成功
)
echo.

:: 5. fixing-metadata
echo [5/6] 安装 fixing-metadata
call npx skills add ibelick/ui-skills@fixing-metadata
if %ERRORLEVEL% NEQ 0 (
    echo [警告] fixing-metadata 安装失败
) else (
    echo [OK] fixing-metadata 安装成功
)
echo.

:: 6. fixing-motion-performance
echo [6/6] 安装 fixing-motion-performance
call npx skills add ibelick/ui-skills@fixing-motion-performance
if %ERRORLEVEL% NEQ 0 (
    echo [警告] fixing-motion-performance 安装失败
) else (
    echo [OK] fixing-motion-performance 安装成功
)
echo.

echo ============================================
echo   安装完成！
echo.
echo   如果部分技能在线安装失败，请将本仓库的
echo   skills/ 目录复制到项目 .agents/skills/ 下
echo ============================================
echo.
pause
