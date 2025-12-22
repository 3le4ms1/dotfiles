param([switch]$Elevated)
$local:ErrorActionPreference = "Stop"

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
        write-host -fore RED "ERROR: User not elevated, aborting"
        exit 1
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit 0
}

function update-write {
    [OutputType([void])]
    param([String]$string)
    Write-Host -fore CYAN "[update] $string"
}

write-host -fore MAGENTA 'Running with full privileges'

update-write "scoop local"
& scoop update *
& scoop cleanup *

update-write "scoop global"
& scoop update * -g
& scoop cleanup * -g

update-write "scoop cache cleaning"
& scoop cache rm -a -g

[Console]::Out.Flush()
[Console]::Error.Flush()

update-write "choco"
& choco upgrade all -y

update-write "Rust"
& rustup update

update-write "git"
& git update-git-for-windows

update-write "MSYS2"
Start-process "msys2.exe" "pacman -Syu --noconfirm" -Wait

# update-write "MSYS2 cache cleaning"
# & msys2.exe pacman -Sc

update-write "PIP"
& python.exe -m pip install --upgrade pip
& pip-review --auto --verbose

update-write "npm"
& npm update * -g
& npm install -g npm

update-write "Upgrading process finished successfully"
