#!/usr/bin/bash

set -e

# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

# Check if script is runned as root user with sudo
# if [ "$EUID" -ne 0 ]; then
# echo "${RED}ERROR: User not elevated, aborting${Color_Off}"
# exit
# fi

# https://stackoverflow.com/questions/6212219/passing-parameters-to-a-bash-function
# https://stackoverflow.com/questions/5767062/how-to-check-if-a-symlink-exists
function create_link {
    # $1 = prgram name
    # $2 = link target
    # $3 = link path

    # check if the link exists
    if [ -L $3 ]; then
        # check if the link is valid
        if [ -e $3 ]; then
            echo "${CYAN}[install] $1: link already exists - $(readlink -f $3)"
        else
            echo "${PURPLE}[install] $1: broken link, recreating"
            rm $3
            ln -s $(readlink -f $2) $3
            echo "${yellow}[install] $1: link created - $(readlink -f $3)"
        fi
    # check if another file with the same name exists
    elif [ -e $3 ]; then
        echo "${RED}[install] $1: file already exists but is not a link"
        echo "${RED}[install] $1: remove the file $3 and retry"
    else
        ln -s $(readlink -f $2) $3
        echo "${YELLOW}[install] $1: link created - $(readlink -f $3)"
    fi
    return 0
}

SCRIPTDIR=$(readlink -f $(dirname -- $0))
# USRHOME=$(readlink -f ${PWD}/..)
USRHOME=$HOME

create_link "emacs"  ${SCRIPTDIR}/emacs/init.el      ${USRHOME}/.emacs
create_link "bash"   ${SCRIPTDIR}/bash/.bashrc       ${USRHOME}/.bashrc
create_link "bash"   ${SCRIPTDIR}/bash/.bash_profile ${USRHOME}/.bash_profile
create_link "mintty" ${SCRIPTDIR}/bash/.minttyrc     ${USRHOME}/.minttyrc
create_link "git"    ${SCRIPTDIR}/git/.gitconfig     ${USRHOME}/.gitconfig
create_link "ghci"   ${SCRIPTDIR}/ghc/.ghci          ${USRHOME}/.ghci

# TODO: create_link "powershell" # i don't know where to put theese on Linux
# TODO: create_link "alacritty"

exit 0
