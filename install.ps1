# Windows 1-Click Install Script for digital-twin-avatar-sheet-architect
$ErrorActionPreference = "Stop"

$TargetDir = Join-Path $env:USERPROFILE ".gemini\config\skills\digital-twin-avatar-sheet-architect"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " 安裝全域技能：digital-twin-avatar-sheet-architect" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

if (Test-Path $TargetDir) {
    Write-Host "偵測到已存在目標目錄，正在進行更新 (git pull)..." -ForegroundColor Yellow
    git -C $TargetDir pull
} else {
    Write-Host "正在 Clone 儲存庫至全域技能目錄..." -ForegroundColor Green
    $ParentDir = Split-Path $TargetDir -Parent
    if (-not (Test-Path $ParentDir)) {
        New-Item -ItemType Directory -Path $ParentDir -Force | Out-Null
    }
    git clone https://github.com/JeffreyHo0520/digital-twin-avatar-sheet-architect.git $TargetDir
}

Write-Host ""
Write-Host "✅ 安裝完成！" -ForegroundColor Green
Write-Host "技能路徑：$TargetDir" -ForegroundColor White
Write-Host "您現在可以在 Antigravity 或 Gemini Agent 中隨時使用此技能！" -ForegroundColor Cyan
