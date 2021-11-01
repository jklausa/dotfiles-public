# PROMPT="[%*] %n:%c $(git_prompt_info)%(!.#.$) "
PROMPT='[%*] %{$fg[magenta]%}%m%{$reset_color%}:%{$fg[cyan]%}%n%{$reset_color%}:%{$fg[green]%}%~%{$reset_color%}$(git_prompt_info) %(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
