GitHub repository to store and easily setup my dotfiles on other systems.
.gitconfig .bashrc .vimrc etc.

Also to easily initialize a coding project by making a .venv and setting up necessary .vscode files.

## User setup
```bash
cd ~
git clone git@github.com:FilipAgert/.dotfiles.git
.dotfiles/setup.sh
```
This backups existing .dotfiles and overrides them with a symlink to the files in this repository.


## Project setup
For setting up a new coding project, in the repo, run:
```bash
~/.dotfiles/setup_proj.sh
```
Currently only Fortran projects are provided. Running this command will install a new .venv in your directory, source the virtual environment,
instlal fortls and create a settings.json file and initial file structure.
