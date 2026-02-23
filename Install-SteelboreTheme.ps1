# Steelbore Theme Installation Script for Windows Terminal
# This script locates settings.json and adds the Steelbore color scheme.

$theme = @{
    name                = "Steelbore"
    background          = "#000027"
    foreground          = "#D98E32"
    cursorColor         = "#E6E6F0"
    selectionBackground = "#4B7EB0"
    black               = "#000027"
    red                 = "#FF5C5C"
    green               = "#50FA7B"
    yellow              = "#D98E32"
    blue                = "#4B7EB0"
    purple              = "#BD93F9"
    cyan                = "#8BE9FD"
    white               = "#E6E6F0"
    brightBlack         = "#6272A4"
    brightRed           = "#FF6E6E"
    brightGreen         = "#69FF94"
    brightYellow        = "#FFFFA5"
    brightBlue          = "#D6ACFF"
    brightPurple        = "#FF92DF"
    brightCyan          = "#A4FFFF"
    brightWhite         = "#FFFFFF"
}

$themeJson = $theme | ConvertTo-Json -Depth 10

$paths = @(
    "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json",
    "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json",
    "$env:LOCALAPPDATA\Microsoft\Windows Terminal\settings.json"
)

$foundAny = $false

foreach ($path in $paths) {
    if (Test-Path $path) {
        $foundAny = $true
        Write-Host "Found settings at: $path"
        
        $backupPath = "$path.bak"
        Copy-Item $path $backupPath -Force
        Write-Host "Backup created at: $backupPath"

        $content = Get-Content $path -Raw
        
        if ($content -match '"name":\s*"Steelbore"') {
            Write-Host "Steelbore theme already exists in $path. Skipping update."
            continue
        }

        # Inject into the 'schemes' array
        if ($content -match '("schemes":\s*\[)') {
            $updatedContent = $content -replace '("schemes":\s*\[)', "`$1`n        $themeJson,"
            $updatedContent | Set-Content $path -Encoding utf8
            Write-Host "Successfully added Steelbore theme to $path"
        }
        else {
            Write-Host "Warning: Could not find 'schemes' array in $path. Searching for a place to insert it..."
            # Fallback: find the first { and insert schemes there if it doesn't exist
            # This is more complex, so we'll just advise manual check for now if schemes is missing
            Write-Host "Please ensure your settings.json has a 'schemes': [] array."
        }
    }
}

if (-not $foundAny) {
    Write-Host "Error: Could not find Windows Terminal settings.json in standard locations."
    Write-Host "Checked paths:"
    $paths | ForEach-Object { Write-Host " - $_" }
}
