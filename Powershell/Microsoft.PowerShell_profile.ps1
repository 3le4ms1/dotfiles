$local:ErrorActionPreference = "Stop"

Import-Module Terminal-Icons

Import-Module gsudoModule
# Set-Alias Prompt gsudoPrompt
Set-Alias sudo gsudo

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

Set-PSReadLineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle None

# =# Alias
Remove-Item Alias:man
Set-Alias man man.exe

Remove-Item Alias:rm
Set-Alias rm rm.exe

Remove-Item Alias:kill
Set-Alias kill kill.exe

Remove-Item -Force Alias:cpp
Set-Alias cpp cpp.exe

# Remove-Item Alias:curl

# Remove-Item Alias:find
# Set-Alias find -Value "C:\msys64\msys64\usr\bin\find.exe"

# Remove-Item -Force Alias:iex
# Set-Alias iex iex.exe

Set-Alias cmd cmd.exe
Set-Alias main .\main.exe

function emacsc {
    & "C:\ProgramData\scoop\apps\emacs\current\bin\emacsclient.exe" -r -n -a "" @Args
}

Set-Alias emacs emacsc

<#
.DESCRIPTION
A simple function to start a random file in the directory tree.  It supports a simple
restriction mechanism based on the file name.
.EXAMPLE
Start-RandomFile "mp3" -Recurse -Accept "song_album" -Decline "unwanted_song_name"
#>
function Start-RandomFile {
    [CmdletBinding()]
    [OutputType([void])]
    param(
            [Parameter(Position=0, Mandatory=$true)]
            [string]$extension = "",
            [Parameter(Position=1, Mandatory=$false)]
            [string]$accept = "",
            [Parameter(Position=2, Mandatory=$false)]
            [string]$decline = "",
            [Parameter(Position=3, Mandatory=$false)]
            [switch]$recurse = $false,
            [parameter(position=4, mandatory=$false)]
            [system.uint32]$depth = 0,
            [parameter(position=5, mandatory=$false)]
            [switch]$fullpath = $false
         );
    $extension = if ($Extension -notlike ".?*") {
        "*.$extension";
    } else {
        "*$extension";
    }
    $files = if ($Recurse) {
        if ($depth -eq 0) {
            Get-ChildItem -Path . -Filter $extension -Recurse -File;
        } else {
            Get-ChildItem -Path . -Filter $extension -Recurse -Depth $depth -File;
        }
    } else {
        Get-ChildItem -Path . -Filter $extension -File;
    }
    if ($accept -notlike $null) {
        $files = $files | where-object {$_.Name -like "*$accept*"};
    }
    if ($decline -notlike $null) {
        $files = $files | where-object {$_.Name -notlike "*$decline*"};
    }
    if ($files.Count -eq 0) {
        $err_str = "No such file found with extension `"${extension}`"";
        if ($accept -notlike $null) {
            $err_str += ", accepting filter `"${accept}`"";
        }
        if ($decline -notlike $null) {
            $err_str += ", declining filter `"${decline}`"";
        }
        Write-Error $err_str;
        return
    }
    $file = $files | Get-Random;
    $logstring = if ($fullpath) {
        "Executing: $($file)";
    } else {
        "Executing: $($file.Name)";
    }
    Write-Host $logstring;
    & $file.FullName;
}

# Functions
function Print-Colors {
    $colors = [Enum]::GetValues( [ConsoleColor] );
    $max = ($colors | foreach { "$_ ".Length } | Measure-Object -Maximum).Maximum;
    foreach( $color in $colors ) {
        Write-Host (" {0,2} {1,$max} " -f [int]$color,$color) -NoNewline;
        Write-Host "$color" -Foreground $color;
    }
}

function msys {
    param([String]$environment);
    $environment = $environment.toUpper();
    try {
        $null = Test-Path (get-command "env").Source;
        & "env" @("MSYSTEM=$environment", "CHERE_INVOKING=1", "/usr/bin/bash", "-li");
    } catch {
    }
}

# Short prompt
function global:prompt {
    $dirSep = [IO.Path]::DirectorySeparatorChar;
    $pathComponents = $PWD.Path.Split($dirSep);
    $displayPath = if ($pathComponents.Count -le 3) {
        $PWD.Path;
    } else {
        '\{0}{1}' -f $dirSep, ($pathComponents[-2,-1] -join $dirSep);
    }
    if ((Test-Admin) -eq $false) {
        return "PS {0}$('>' * ($nestedPromptLevel + 1)) " -f $displayPath;
    } else {
        return "PS {0}$('#' * ($nestedPromptLevel + 1)) " -f $displayPath;
    }
}

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent());
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator);
}
