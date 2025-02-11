# dotfiles

Cambiar el .zshrc por esto:

```
source "${HOME}/.dotfiles/zshrc.zsh"

#SOLO SI HAY INCOMPATIBILIDAD con python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export CLOUDSDK_PYTHON=$(which python3)
```
