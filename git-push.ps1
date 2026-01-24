<#
.SYNOPSIS
    一个健壮的 Git 自动提交和推送脚本。
.DESCRIPTION
    此脚本会自动执行以下操作：
    1. 检查工作区是否有未提交的更改。
    2. 如果有，则使用当前日期作为提交信息来执行 'git add' 和 'git commit'。
    3. 检查本地分支是否领先于远程分支（即是否有未推送的提交）。
    4. 如果有，则执行 'git push'。
    5. 脚本执行完毕后会暂停，等待用户按键退出，以便查看输出。
.NOTES
    作者: Gemini
    版本: 2.0
#>

# 强制脚本在遇到错误时停止执行，这是一种好的实践
$ErrorActionPreference = 'Stop'

# --- 步骤 1: 初始化和环境检查 ---
try {
    # 检查是否在 Git 仓库中
    git rev-parse --is-inside-work-tree | Out-Null
}
catch {
    Write-Host "错误：当前目录不是一个有效的 Git 仓库！" -ForegroundColor Red
    Write-Host "请先在目标文件夹中运行 'git init' 或 'git clone'。" -ForegroundColor Yellow
    Read-Host "按 Enter 键退出..."
    exit 1
}

Write-Host "✅ Git 仓库环境检查通过。"
Write-Host "----------------------------------------"


# --- 步骤 2: 检查本地文件变更，并根据情况提交 ---
Write-Host "正在检查本地文件变更..."

# 使用 `git status --porcelain`，如果输出不为空，则说明有变更
$changes = git status --porcelain
if ($null -ne $changes) {
    Write-Host "检测到文件变更，准备执行 'git add' 和 'git commit'..."
    
    # 准备提交信息
    $today = Get-Date -Format "yyyy-MM-dd"
    $commitMessage = "update: $today"
    Write-Host "提交信息为: '$commitMessage'"
    
    # 执行 git add
    Write-Host "正在执行 'git add .'..."
    git add .
    Write-Host "✅ 'git add' 成功。"

    # 执行 git commit
    Write-Host "正在执行 'git commit'..."
    git commit -m "$commitMessage"
    Write-Host "✅ 'git commit' 成功。"

} else {
    Write-Host "ℹ️ 工作区是干净的，没有需要提交的新更改。"
}

Write-Host "----------------------------------------"


# --- 步骤 3: 检查本地与远程的同步状态，并根据情况推送 ---
Write-Host "正在检查是否需要推送到远程仓库..."

try {
    # 首先，更新本地对远程分支的认知，但不做任何合并
    git remote update
    
    # 检查本地 HEAD 相对于其上游分支（通常是 origin/main）的状态
    # 使用 rev-list 命令精确计算本地领先远程的提交数量
    $commitsToPush = git rev-list --count '@{u}..HEAD'
    
    if ($commitsToPush -gt 0) {
        Write-Host "本地分支领先远程分支 $commitsToPush 个提交。正在执行 'git push'..."
        
        # 执行 git push
        # 你可以把 'main' 改成你常用的分支名，比如 'master'
        git push origin main
        
        Write-Host "✅ 'git push' 成功。"
        
    } else {
        Write-Host "ℹ️ 本地分支与远程分支已同步，无需推送。"
    }
}
catch {
    # 这里的 catch 会捕获 `git remote update` 或 `git rev-list` 可能的失败
    # 例如，远程仓库不存在，或者没有设置上游分支
    $errorMessage = $_.Exception.Message
    if ($errorMessage -like '*no upstream configured*') {
         Write-Host "警告：当前分支没有配置上游跟踪分支。" -ForegroundColor Yellow
         Write-Host "请尝试手动运行 'git push -u origin <branch-name>' 建立跟踪关系。" -ForegroundColor Yellow
    }
    else {
        Write-Host "错误：在与远程仓库同步时发生未知错误。" -ForegroundColor Red
        Write-Host "错误详情: $errorMessage" -ForegroundColor Red
        Write-Host "请检查网络连接和远程仓库配置。" -ForegroundColor Yellow
    }
}

# --- 步骤 4: 脚本执行完毕 ---
Write-Host "----------------------------------------"
Write-Host "🎉 脚本执行完毕！" -ForegroundColor Green
Read-Host "按 Enter 键退出..."
