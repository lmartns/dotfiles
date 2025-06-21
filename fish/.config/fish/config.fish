if status is-interactive
    set -gx PATH $HOME/.local/share/fnm $PATH
    set -Ux PATH $PATH /Users/leo/.local/bin
    set PATH /Users/leo/.local/bin $PATH

    set fish_greeting
    fnm env --use-on-cd | source
    starship init fish | source
    zoxide init fish | source

    alias cat="bat --paging=never"
    alias ls="eza --icons --color=always"
    alias ll="eza -lah --icons --color=always"
    alias la="eza -a --icons --color=always"

    
    set -g fish_history_max 10000
    set -g fish_history_ignore_space yes
    
    set -g fish_complete_path $fish_complete_path ~/.config/fish/completions
    
    set -g fish_complete_case_insensitive yes
    
    set -g fish_color_command green
    set -g fish_color_param cyan
    set -g fish_color_error red --bold
    set -g fish_color_autosuggestion brblack
    
    function __fish_git_branches
        git branch 2>/dev/null | sed 's/^..//g'
    end
    
   
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8
end
