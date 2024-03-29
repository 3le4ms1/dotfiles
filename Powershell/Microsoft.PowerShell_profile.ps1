Write-Host "`$Profile Core " -NoNewline -ForegroundColor Cyan
Write-Host "=> " -NoNewline -ForegroundColor DarkGray
Write-Host "$Profile`r`n"  -ForegroundColor Yellow

Import-Module Terminal-Icons

# =# Scoop search
Invoke-Expression (&scoop-search --hook)

# =# Dracula

# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`

Set-PSReadlineOption -Color @{
    "Command" = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator" = [ConsoleColor]::Magenta
    "Variable" = [ConsoleColor]::White
    "String" = [ConsoleColor]::Yellow
    "Number" = [ConsoleColor]::Blue
    "Type" = [ConsoleColor]::Cyan
    "Comment" = [ConsoleColor]::DarkCyan
}

# =# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# =# Scoop
Invoke-Expression (&scoop-search --hook)

# =# Emacs keybindings
Set-PSReadLineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle None

# =# Alias
Remove-Item Alias:man
Set-Alias man man.exe

Remove-Item Alias:rm
Set-Alias rm rm.exe

# Remove-Item Alias:find
# Set-Alias find -Value "C:\msys64\msys64\usr\bin\find.exe"

# =# Macchina
# . macchina

# =# Functions
function Show-Colors() {
    $colors = [Enum]::GetValues( [ConsoleColor] )
    $max = ($colors | foreach { "$_ ".Length } | Measure-Object -Maximum).Maximum
    foreach( $color in $colors ) {
        Write-Host (" {0,2} {1,$max} " -f [int]$color,$color) -NoNewline
        Write-Host "$color" -Foreground $color
  }
}
