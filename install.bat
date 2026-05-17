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

:: Detect script directory (where this bat file is located)
set SKILLS_DIR=%~dp0.agents\skills

:: 1. frontend-design
echo [1/6] 安装 frontend-design（官方）
call npx skills add anthropics/skills@frontend-design
if %ERRORLEVEL% NEQ 0 (
    echo [警告] frontend-design 在线安装失败，尝试本地复制...
    if exist "%SKILLS_DIR%\frontend-design" (
        xcopy /E /I /Y "%SKILLS_DIR%\frontend-design" ".agents\skills\frontend-design"
        echo [OK] frontend-design 已从本地复制
    ) else (
        echo [警告] 未找到 frontend-design 本地文件
    )
) else (
    echo [OK] frontend-design 安装成功
)
echo.

:: 2. ui-ux-pro-max
echo [2/6] 安装 ui-ux-pro-max（社区）
echo [提示] 从本地复制...
if exist "%SKILLS_DIR%\ui-ux-pro-max" (
    xcopy /E /I /Y "%SKILLS_DIR%\ui-ux-pro-max" ".agents\skills\ui-ux-pro-max"
    echo [OK] ui-ux-pro-max 已从本地复制
) else (
    echo [警告] 未找到 ui-ux-pro-max 本地文件
)
echo.

:: 3. baseline-ui
echo [3/6] 安装 baseline-ui
call npx skills add ibelick/ui-skills@baseline-ui
if %ERRORLEVEL% NEQ 0 (
    echo [警告] baseline-ui 在线安装失败，尝试本地复制...
    if exist "%SKILLS_DIR%\baseline-ui" (
        xcopy /E /I /Y "%SKILLS_DIR%\baseline-ui" ".agents\skills\baseline-ui"
        echo [OK] baseline-ui 已从本地复制
    ) else (
        echo [警告] 未找到 baseline-ui 本地文件
    )
) else (
    echo [OK] baseline-ui 安装成功
)
echo.

:: 4. fixing-accessibility
echo [4/6] 安装 fixing-accessibility
call npx skills add ibelick/ui-skills@fixing-accessibility
if %ERRORLEVEL% NEQ 0 (
    echo [警告] fixing-accessibility 在线安装失败，尝试本地复制...
    if exist "%SKILLS_DIR%\fixing-accessibility" (
        xcopy /E /I /Y "%SKILLS_DIR%\fixing-accessibility" ".agents\skills\fixing-accessibility"
        echo [OK] fixing-accessibility 已从本地复制
    ) else (
        echo [警告] 未找到 fixing-accessibility 本地文件
    )
) else (
    echo [OK] fixing-accessibility 安装成功
)
echo.

:: 5. fixing-metadata
echo [5/6] 安装 fixing-metadata
call npx skills add ibelick/ui-skills@fixing-metadata
if %ERRORLEVEL% NEQ 0 (
    echo [警告] fixing-metadata 在线安装失败，尝试本地复制...
    if exist "%SKILLS_DIR%\fixing-metadata" (
        xcopy /E /I /Y "%SKILLS_DIR%\fixing-metadata" ".agents\skills\fixing-metadata"
        echo [OK] fixing-metadata 已从本地复制
    ) else (
        echo [警告] 未找到 fixing-metadata 本地文件
    )
) else (
    echo [OK] fixing-metadata 安装成功
)
echo.

:: 6. fixing-motion-performance
echo [6/6] 安装 fixing-motion-performance
call npx skills add ibelick/ui-skills@fixing-motion-performance
if %ERRORLEVEL% NEQ 0 (
    echo [警告] fixing-motion-performance 在线安装失败，尝试本地复制...
    if exist "%SKILLS_DIR%\fixing-motion-performance" (
        xcopy /E /I /Y "%SKILLS_DIR%\fixing-motion-performance" ".agents\skills\fixing-motion-performance"
        echo [OK] fixing-motion-performance 已从本地复制
    ) else (
        echo [警告] 未找到 fixing-motion-performance 本地文件
    )
) else (
    echo [OK] fixing-motion-performance 安装成功
)
echo.

echo ============================================
echo   安装完成！
echo.
echo   使用流程:
echo   frontend-design ^> baseline-ui
echo   ^> fixing-accessibility ^> fixing-motion-performance
echo.
echo   提示：别忘了把 CLAUDE.md 复制到项目根目录
echo ============================================
echo.
pause
