param([switch]$Elevated)
$local:ErrorActionPreference = "Stop"
Set-Strictmode -Version Latest

function install-write {
    [OutputType([void])]
    param([ConsoleColor]$color, [String]$string)
    Write-Host -fore $color "[install] $string"
}

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    install-write RED "ERROR: User not elevated, aborting"
    exit 1
}

function create_link {
    [OutputType([void])]
    param([string]$name, [string]$link_target, [string]$link_path)

    # check if file already exists
    if(test-path $link_path) {
        # check if file is a link
        if((get-item $link_path).LinkType -eq "Symboliclink") {
            # check if the link is the desired link
            if((Get-Item $link_path | Select-Object -ExpandProperty Target) -eq $(resolve-path $link_target)) {
                install-write CYAN "$($name): link already exists - $(resolve-path $link_path)"
            } else {
                install-write DARKMAGENTA "$($name): broken link, recreating"
                rm -Force $link_path
                $null = new-item -itemtype SymbolicLink -Target $(resolve-path $link_target) -Path $link_path
                install-write YELLOW "$($name): link created - $(resolve-path $link_path)"
            }
        } else {
            install-write RED "$($name): file already exists but is not a link"
            install-write RED "$($name): remove the file $link_path and retry"
        }
    } else {
        $null = new-item -itemtype SymbolicLink -Target $(resolve-path $link_target) -Path $link_path
        install-write YELLOW "$($name): link created - $(resolve-path $link_path)"
    }
}

$script:scriptdir = $(resolve-path $PSScriptRoot)
$script:usrhome = $(resolve-path "$script:scriptdir/..")
$script:startup_folder = $(resolve-path "$env:USERPROFILE/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup")

create_link "emacs"      "$script:scriptdir/emacs/init.el" "$script:usrhome/.emacs"
create_link "emacs"      "$script:scriptdir/emacs/emacs_startup.cmd" "$script:startup_folder/emacs_startup.cmd"
create_link "bash"       "$script:scriptdir/bash/.bashrc" "$script:usrhome/.bashrc"
create_link "bash"       "$script:scriptdir/bash/.bash_profile" "$script:usrhome/.bash_profile"
create_link "mintty"     "$script:scriptdir/bash/.minttyrc" "$script:usrhome/.minttyrc"
create_link "git"        "$script:scriptdir/git/.gitconfig" "$script:usrhome/.gitconfig"
create_link "ghci"       "$script:scriptdir/ghc/.ghci" "$script:usrhome/.ghci"
create_link "powershell" "$script:scriptdir/Powershell/Microsoft.PowerShell_profile.ps1" "$env:userprofile/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
create_link "alacritty"  "$script:scriptdir/alacritty/alacritty.toml" "$env:appdata/alacritty/alacritty.toml"

exit 0
