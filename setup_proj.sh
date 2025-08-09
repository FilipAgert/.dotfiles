
#!/usr/bin/env bash
set -euo pipefail

create_venv() {
  local venv_dir=".venv"
  if [ ! -d "$venv_dir" ]; then
    echo "Creating virtual environment in $venv_dir"
    python3 -m venv "$venv_dir"
  else
    echo "Virtual environment $venv_dir already exists, skipping."
  fi
  source .venv/bin/activate
}
echo "Select your project language:"
select lang in python cpp fortran; do
  if [[ -n "$lang" ]]; then
    echo "You selected: $lang"
    break
  else
    echo "Invalid choice, try again."
  fi
done

mkdir -p .vscode src data

case "$lang" in
  python)
    create_venv 
    # Copy vscode settings
    cp ~/.dotfiles/setup/vscode/python_settings.json .vscode/settings.json
    ;;

  cpp)
    cp ~/.dotfiles/setup/vscode/cpp_settings.json .vscode/settings.json
    ;;

  fortran)
    create_venv
    pip3 install fortls
    cp ~/.dotfiles/setup/vscode/fortran_settings.json .vscode/settings.json
    cp ~/.dotfiles/setup/make/fortran makefile
    mkdir -p build app build/obj build/mod   
    ;;

  *)
    echo "Unsupported language"
    exit 1
    ;;
esac

echo "Project structure set up for $lang."
