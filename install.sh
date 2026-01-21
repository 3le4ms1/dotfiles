#!/usr/bin/env sh

set -e

# Check if script is runned as root user with sudo
# if [ "$EUID" -ne 0 ]; then
# echo -e "ERROR: User not elevated, aborting"
# exit
# fi

# https://stackoverflow.com/questions/6212219/passing-parameters-to-a-bash-function
# https://stackoverflow.com/questions/5767062/how-to-check-if-a-symlink-exists

# SUCC
# CLR
# WARN
# ERR

create_link() {
    local program_name=$1
    local file_target=$2
    local link_path=$3

    # check if $file_target is a valid file or not
    if [ ! -e $file_target ]; then
        echo "[create ERR] ${program_name}: file provided does not exist: ${file_target}"
        return
    fi

    # check if the $link_path directory exists
    local link_path_directory="$(dirname ${link_path})"
    if [ ! -d $link_path_directory ]; then
        echo "[create ERR] ${program_name}: the target directory of the symlink does not exists: ${link_path_directory}"
        echo "---------->> ${program_name}: create first the directory required or change target"
        return
    fi

    # check if $list_target does not already exists
    if [ ! -e $link_path ]; then
        ln -s $(readlink -f $file_target) $link_path
        echo "[create SUCC] ${program_name}: link created:"
        echo "----------->> ${program_name}: ${file_target} -> ${link_path}"
        return
    fi

    # check if $link_target is not a link
    if [ ! -L $link_path ]; then
        # the file $file_target exists, but it is not a symlink, it is regular file
        echo "[create ERR] ${program_name}: file already exists but is not a link"
        echo "---------->> ${program_name}: remove or rename first the file: ${link_path}"
        return
    fi

    # check if $link_path and $file_target are the same file
    if [ $link_path = $file_target ]; then
        echo "[create WARN] ${program_name}: the symlink and file path provided point to the same place"
        echo "----------->> ${program_name}: symlink:     ${link_path}"
        echo "----------->> ${program_name}: file target: ${file_target}"
        return
    fi

    # check if the $link_path is linked to $file_target
    if [ "$(readlink -- ${link_path})" = $file_target ]; then
        echo "[create CLR] ${program_name}: link already exists:"
        echo "---------->> ${program_name}: ${file_target} -> ${link_path}"
        return
    else
        echo "[create WARN] ${program_name}: broken link, recreating"
        rm $link_path
        ln -s $(readlink -f $file_target) $link_path
        echo "---------->> ${program_name}: link created:"
        echo "---------->> ${program_name}: $(readlink -f ${link_path})"
        return
    fi
}

delete_link() {
    local program_name=$1
    local file_target=$2
    local link_path=$3

    # check if $link_path provided exists
    if [ ! -e $link_path ]; then
        echo "[delete WARN] the symlink provided does not exist: ${link_path}"
        return
    fi

    # check if $file_target provided exists
    if [ ! -e $file_target ]; then
        echo "[delete WARN] the file provided does not exist: ${file_target}"
        return
    fi

    # check if $link_path is not a symlink
    if [ ! -L $link_path ]; then
        echo "[delete WARN] ${program_name}: the symlink provided is, in fact, not a symlink"
        return
    fi

    # check if $link_path and $file_target are the same file
    if [ $link_path = $file_target ]; then
        echo "[delete WARN] ${program_name}: the symlink and file path provided point to the same place"
        echo "----------->> ${program_name}: symlink:     ${link_path}"
        echo "----------->> ${program_name}: file target: ${file_target}"
        return
    fi

    # SECURITY MEASURE: check if $link_path points to $file_target
    if [ "$(readlink -- ${link_path})" = $file_target ]; then
         echo "[delete SUCC] ${program_name}: removing the symlink: ${link_path}"
         rm $link_path
         return
    else
        echo "[delete ERR] ${program_name}: the symlink does not point to the file provided:"
        echo "---------->> ${program_name}: ${link_path} -/> ${file_target}"
        return
    fi
}

SCRIPTDIR=$(readlink -f $(dirname -- $0))
# USRHOME=$(readlink -f ${PWD}/..)
USRHOME=$HOME

create_link "emacs"  ${SCRIPTDIR}/emacs/init.el      ${USRHOME}/.emacs
create_link "bash"   ${SCRIPTDIR}/bash/.bashrc       ${USRHOME}/.bashrc
create_link "bash"   ${SCRIPTDIR}/bash/.bash_profile ${USRHOME}/.bash_profile
create_link "sh"     ${SCRIPTDIR}/sh/update.sh       ${USRHOME}/utils/update.sh
create_link "tmux"   ${SCRIPTDIR}/tmux/.tmux.conf    ${USRHOME}/.tmux.conf
create_link "mintty" ${SCRIPTDIR}/bash/.minttyrc     ${USRHOME}/.minttyrc
create_link "git"    ${SCRIPTDIR}/git/.gitconfig     ${USRHOME}/.gitconfig
create_link "nvim"   ${SCRIPTDIR}/nvim/init.lua      ${USRHOME}/.config/nvim/init.lua
create_link "gdb"    ${SCRIPTDIR}/gdb/.gdbinit       ${USRHOME}/.gdbinit
# create_link "ghci"   ${SCRIPTDIR}/ghc/.ghci          ${USRHOME}/.ghci

# TODO: create_link "powershell" # i don't know where to put theese on Linux
# TODO: create_link "alacritty"

exit 0
