param([switch]$Elevated)
$local:ErrorActionPreference = "Stop"
Set-Strictmode -Version Latest

function install-write {
    [OutputType([void])]
    param([ConsoleColor]$color, [String]$string)
    Write-Host -fore $color "$string"
}

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    install-write RED "ERROR: User not elevated, aborting"
    exit 1
}

# Color Legend
# RED -- error
# YELLOW -- UPDATE
# PURPLE/DARKMAGENTA -- WANRING
# CYAN -- no changes

function create_link {
    [OutputType([void])]
    param([string]$program_name, [string]$file_target, [string]$link_path)

    # check if $file_target is a valid file or not
    if (-not (test-path -Path $file_target)) {
        install-write RED "[create] ${program_name}: file provided does not exist: $file_target"
        return
    }

    # check if the $link_path directory exists
    $link_path_directory= Split-path -Path $link_path
    if (-not (Test-path $link_path_directory -PathType Container)) {
        install-write RED "[create] ${program_name}: the target directory of the symlink does not exists: `t$link_path_directory"
        install-write RED "------>> ${program_name}: create first the directory required or change target"
        return
    }

    # check if $list_target does not already exists
    if (-not (test-path -Path $link_path)) {
        $null = new-item -itemtype SymbolicLink -Target $(resolve-path $file_target) -Path $link_path
        install-write YELLOW "[create] ${program_name}: link created:"
        install-write YELLOW "`t$file_target -> $link_path"
        return
    }

    # check if $link_target is not a link
    if(-not ((get-item $link_path).LinkType -eq "Symboliclink")) {
        # the file $file_target exists, but it is not a symlink, it is regular file
        install-write RED "[create] ${program_name}: file already exists but is not a link"
        install-write RED "------>> ${program_name}: remove or rename first the file: $link_path"
        return
    }

    # check if the $link_path is linked to $file_target
    if((Get-Item $link_path | Select-Object -ExpandProperty Target) -eq $(resolve-path $file_target)) {
        install-write CYAN "[create] ${program_name}: link already exists:"
        install-write CYAN "`t$file_target -> $link_path"
    } else {
        install-write DARKMAGENTA "[create] ${program_name}: broken link, recreating"
        Remove-Item -Force $link_path
        $null = new-item -itemtype SymbolicLink -Target $(resolve-path $file_target) -Path $link_path
        install-write YELLOW "[create] ${program_name}: link created: `t$(readlink -f $link_path)"
    }

    return
}

function delete_link {
    [OutputType([void])]
    param([string]$program_name, [string]$file_target, [string]$link_path)
    # check if $link_path does not exist
    if (-not (Test-Path -Path $link_path)) {
        install-write DARKMAGENTA "[delete] ${program_name}: the synmlink provided does not exists: `t$link_path"
        return
    }

    # check if $file_target does not exist
    if (-not (Test-Path -Path $file_target)) {
        install-write DARKMAGENTA "[delete] ${program_name}: the file provided does not exists: `t$file_target"
        return
    }

    # check if $link_path is not a symlink
    if(-not ((get-item $link_path).LinkType -eq "SymbolicLink")) {
        install-write DARKMAGENTA "[delete] ${program_name}: the symlink provided is not a symlink: `t$link_path"
        return
    }

    # SECURITY MEASURE: check if $link_path points to $file_target
    if((Get-Item $link_path | Select-Object -ExpandProperty Target) -eq $(resolve-path $file_target)) {
        install-write YELLOW "[delete] ${program_name}: removing the symlink: `t$link_path"
        Remove-Item -Force $link_path
    } else {
        install-write RED "[delete] ${program_name}: the symlink does not point to the file provided:"
        install-write RED "`t$link_path -/> $file_target"
    }

    return
}

$script:scriptdir = $(resolve-path $PSScriptRoot)
$script:usrhome = $(resolve-path "$script:scriptdir/..")
$script:startup_folder = $(resolve-path "$env:USERPROFILE/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup")

create_link "emacs"      "$script:scriptdir/emacs/init.el"           "$script:usrhome/.emacs"
# delete_link "emacs"      "$script:scriptdir/emacs/emacs_startup.cmd" "$script:startup_folder/emacs_startup.cmd"
create_link "bash"       "$script:scriptdir/bash/.bashrc"            "$script:usrhome/.bashrc"
create_link "bash"       "$script:scriptdir/bash/.bash_profile"      "$script:usrhome/.bash_profile"
create_link "tmux"       "$script:scriptdir/tmux/.tmux.conf"         "$script:usrhome/.tmux.conf"
create_link "mintty"     "$script:scriptdir/bash/.minttyrc"          "$script:usrhome/.minttyrc"
create_link "git"        "$script:scriptdir/git/.gitconfig"          "$script:usrhome/.gitconfig"
create_link "racket"     "$script:scriptdir/racket/.racketrc"        "$script:usrhome/.racketrc"
create_link "ghci"       "$script:scriptdir/ghc/.ghci"               "$script:usrhome/.ghci"
create_link "alacritty"  "$script:scriptdir/alacritty/alacritty.toml" "$env:appdata/alacritty/alacritty.toml"
create_link "gdb"        "$script:scriptdir/gdb/.gdbinit"            "$script:usrhome/.gdbinit"
create_link "pwsh"       "$script:scriptdir/Powershell/Microsoft.PowerShell_profile.ps1" "$env:userprofile/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
create_link "pwsh"       "$script:scriptdir/Powershell/update.ps1"   "$script:usrhome/utils/update.ps1"
create_link "tiled"      "$script:scriptdir/tiled/extensions"        "${env:USERPROFILE}/Appdata/Local/Tiled/extensions"
create_link "mpv"        "$script:scriptdir/mpv/mpv.conf"            "${env:USERPROFILE}/Appdata/Roaming/mpv/mpv.conf"
exit 0
