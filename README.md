# Dotfiles
Configuration files for things, across different systems.

# Deploy
  To install the configuration just run the installation script in the
  terminal.

  It is advised to install the configuration in the `$XDG_CONFIG_HOME`
  directory, under `$HOME`, even on Windows.

## Linux
   On Linux the script must **not** be run as administrator, but as the user which
   is going to use the config files.
   ``` bash
     $ ./install.sh
   ```

## Windows
   The install script must be run as administrator to work properly.

   Even on Windows, to work properly it is necessary to set the environment
   variables `$HOME` and `$XDG_CONFIG_HOME`. This is due to references of these
   variables in some configs.

   The [gsudo](https://github.com/gerardog/gsudo) package can be installed with
   the [scoop](https://www.scoop.sh) package manager. In alternative the script
   can be just runned in ad elevated shell.
   ``` powershell
   PS> gsudo install.ps1
   PS(root)> install.ps1
   ```

# Managing TODOs
  To quick search all the TODOs in the configuration i leave here a simple
  `grep` command, just to have quick access
  ```sh
    $ grep -rn "TODO" --exclude-dir="*.git*" --exclude-dir="foreign" --exclude="org-mode.el"
  ```

# Program specific things
## Emacs
   When starting `emacs` for the first time on a clean platform, there are some
   operations to be executed:
   - running `emacs` as a daemon to create the `server` file in the
     `~/.emacs.d/server` directory, by running the command:
     ```bash
       $ emacs --daemon
     ```

   - install all of the packages that are missing, using emacs function `M-x
     package-install-selected-packages RET`. It is useful to run the command
     multiple times, in case of errors regard too many files opened or something
     else.
