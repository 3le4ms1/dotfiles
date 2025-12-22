#!/usr/bin/env sh

set -e

# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

# Reset
Color_Off='\033[0m'       # Text Reset
NC=$Color_Off             # alias

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
# echo -e "${RED}ERROR: User not elevated, aborting${Color_Off}"
# exit
# fi

# https://stackoverflow.com/questions/6212219/passing-parameters-to-a-bash-function
# https://stackoverflow.com/questions/5767062/how-to-check-if-a-symlink-exists

# Color Legend
# RED -- error
# YELLOW -- UPDATE
# PURPLE/DARKMAGENTA -- WANRING
# CYAN -- no changes

create_link() {
    local program_name=$1
    local file_target=$2
    local link_path=$3

    # check if $file_target is a valid file or not
    if [ ! -e $file_target ]; then
        echo "${Yellow}[create] $program_name: file provided does not exist: $file_target${Color_Off}"
	      return 1
    fi

    # check if the $link_path directory exists
    local link_path_directory="$(dirname $link_path)"
    if [ ! -d $link_path_directory ]; then
        echo "${Red}[create] $program_name: the target directory of the symlink does not exists: $link_path_directory${Color_Off}"
        echo "${Red}------>> $program_name: create first the directory required or change target${Color_Off}"
	      return 1
    fi

    # check if $list_target does not already exists
    if [ ! -e $link_path ]; then
        ln -s $(readlink -f $file_target) $link_path
        echo "${Yellow}[create] $program_name: link created:${Colow-Off}"
        echo "${Yellow}\t$file_target -> $link_path${Color_Off}"
        return 1
    fi

    # check if $link_target is not a link
    if [ ! -L $link_path ]; then
        # the file $file_target exists, but it is not a symlink, it is regular file
        echo "${Red}[create] $program_name: file already exists but is not a link${Color_Off}"
        echo "${Red}------>> $program_name: remove or rename first the file: $link_path${Color_Off}"
	    return 2
    fi

    # check if the $link_path is linked to $file_target
    if [ "$(readlink -- $link_path)" = $file_target ]; then
        echo "${Cyan}[create] $program_name: link already exists:${Color_Off}"
        echo "${Yellow}\t$file_target -> $link_path${Color_Off}"
    else
        echo "${Purple}[create] $program_name: broken link, recreating${Color_Off}"
        rm $link_path
        ln -s $(readlink -f $file_target) $link_path
        echo "${Yellow}[create] $program_name: link created: \t$(readlink -f $link_path)${Color_Off}"
    fi
    return 0
}

delete_link() {
    local program_name=$1
    local file_target=$2
    local link_path=$3

    # check if $link_path provided exists
    if [ ! -e $link_path ]; then
        echo "${Yellow}[delete] the symlink provided does not exist $link_path${Color_Off}"
        return 1
    fi

    # check if $file_target provided exists
    if [ ! -e $file_target ]; then
        echo "${Yellow}[delete] the symlink provided does not exist $file_target${Color_Off}"
        return 1
    fi

    # check if $link_path is not a symlink
    if [ ! -L $link_path ]; then
        echo "${RED}[delete]TODO: finire"
        echo "${}[delete] ${program_name}: the symlink provided is not a symlink"
    fi

    # SECURITY MEASURE: check if $link_path points to $file_target
    if [ "$(readlink -- $link_path)" = $file_target ]; then
         echo "${Yellow}[delete] ${program_name}: removing the symlink: \t$link_path${Color_Off}"
         rm $link_path
    else
        echo "${Red}[delete] ${program_name}: the symlink does not point to the file provided:${Color_Off}"
        echo "${Red}\t$link_path -/> $file_target${Color_Off}"
    fi
}

SCRIPTDIR=$(readlink -f $(dirname -- $0))
# USRHOME=$(readlink -f ${PWD}/..)
USRHOME=$HOME

create_link "emacs"  ${SCRIPTDIR}/emacs/init.el      ${USRHOME}/.emacs
create_link "bash"   ${SCRIPTDIR}/bash/.bashrc       ${USRHOME}/.bashrc
create_link "bash"   ${SCRIPTDIR}/bash/.bash_profile ${USRHOME}/.bash_profile
create_link "bash"   ${SCRIPTDIR}/bash/.dircolors    ${USRHOME}/.dircolors
create_link "bash"   ${SCRIPTDIR}/bash/update.sh     ${USRHOME}/utils/update.sh
create_link "tmux"   ${SCRIPTDIR}/tmux/.tmux.conf    ${USRHOME}/.tmux.conf
create_link "mintty" ${SCRIPTDIR}/bash/.minttyrc     ${USRHOME}/.minttyrc
create_link "git"    ${SCRIPTDIR}/git/.gitconfig     ${USRHOME}/.gitconfig
create_link "nvim"   ${SCRIPTDIR}/nvim/init.lua      ${USRHOME}/.config/nvim/init.lua
create_link "gdb"    ${SCRIPTDIR}/gdb/.gdbinit       ${USRHOME}/.gdbinit
# create_link "ghci"   ${SCRIPTDIR}/ghc/.ghci          ${USRHOME}/.ghci

# TODO: create_link "powershell" # i don't know where to put theese on Linux
# TODO: create_link "alacritty"

echo "${Color_Off}"
exit 0
