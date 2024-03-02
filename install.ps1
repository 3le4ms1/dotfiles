param([switch]$Elevated)
$local:ErrorActionPreference = "Stop"

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
    param([string]$name, [string]$link_path, [string]$link_target)
    install-write CYAN $name

    # check if file already exists
    if(test-path $link_path) {
        # check if file is a link
        if((get-item $link_path).LinkType -eq "Symboliclink") {
            # check if the link is the desired link
            if((Get-Item $link_path | Select-Object -ExpandProperty Target) -eq $link_target) {
                install-write CYAN "$name: link already exists"
            } else {
                install-write DARKMAGENTA "$name: broken link, recreating"
                rm -Force $link_path
                new-item -itemtype SymbolicLink -Path $link_path -Target $link_target
                install-write YELLOW "$name: link created"
            }
        } else {
            install-write RED "$name: file already exists but is not a link"
            install-write RED "$name: remove the file $3 and retry"
        }
    } else {
        new-item -itemtype SymbolicLink -Path $link_path -Target $link_target
        install-write YELLOW "$name: link created"
    }
}


$pwd = get-location
# install-write CYAN $pwd

install-write CYAN "emacs"
new-item -itemtype SymbolicLink -Path "$pwd\..\.emacs" -Target "$pwd/emacs/init.el"

install-write CYAN "bash"
new-item -itemtype SymbolicLink -Path "$pwd\..\.bashrc" -Target "$pwd/bash/.bashrc"

exit 0
