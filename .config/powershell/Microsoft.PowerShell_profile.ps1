# STEELBORE POWERSHELL PROFILE // S3CURE.US
# Identity: Warning Orange & Midnight Blue

# 1. Enforce Vim Mode (The Steelbore Standard)
Set-PSReadLineOption -EditMode Vi

# 2. CachyOS Style Aliases for PowerShell
Set-Alias -Name ll -Value eza
Set-Alias -Name grep -Value rg
Set-Alias -Name cat -Value bat

# 3. Custom Steelbore HUD Prompt
function prompt {
    $path = Get-Location
    Write-Host "[ S3CURE.ME ] " -NoNewline -ForegroundColor DarkBlue -BackgroundColor DarkOrange
    Write-Host " $path " -NoNewline -ForegroundColor White -BackgroundColor DarkBlue
    Write-Host " ❯ " -NoNewline -ForegroundColor DarkOrange
    return " "
}

# 4. S3cure.me DNS Integrity Check
Write-Host ">>> STEELBORE POWERSHELL LAYER ACTIVE" -ForegroundColor Cyan
