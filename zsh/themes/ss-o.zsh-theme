prompt() {
    IBlack='\e[0;90m'
    IRed='\e[0;91m'
    IGreen='\e[0;92m'
    IYellow='\e[0;93m'
    IBlue='\e[0;94m'
    IPurple='\e[0;95m'
    ICyan='\e[0;96m'
    IWhite='\e[0;97m'
    # ============================================================================= #
    #  ➜ ➜ ➜ BoldHigh Intensity
    # ============================================================================= #
    BIBlack='\e[1;90m'
    BIRed='\e[1;91m'
    BIGreen='\e[1;92m'
    BIYellow='\e[1;93m'
    BIBlue='\e[1;94m'
    BIPurple='\e[1;95m'
    BICyan='\e[1;96m'
    BIWhite='\e[1;97m'
    # ============================================================================= #
    #  ➜ ➜ ➜ Background
    # ============================================================================= #
    On_Black='\e[40m'
    On_Red='\e[41m'
    On_Green='\e[42m'
    On_Yellow='\e[43m'
    On_Blue='\e[44m'
    On_Purple='\e[45m'
    On_Cyan='\e[46m'
    On_White='\e[47m'
    # ============================================================================= #
    #  ➜ ➜ ➜ High Intensity Backgrounds
    # ============================================================================= #
    On_IBlack='\e[0;100m'
    On_IRed='\e[0;101m'
    On_IGreen='\e[0;102m'
    On_IYellow='\e[0;103m'
    On_IBlue='\e[0;104m'
    On_IPurple='\e[0;105m'
    On_ICyan='\e[0;106m'
    On_IWhite='\e[0;107m'
    if [ ! -z "${GITHUB_USER}" ]; then
        local USERNAME="@${GITHUB_USER}"
    else
        local USERNAME="%n"
    fi
    PROMPT="%{$fg[$IBlue]%}${USERNAME} %(?:%{$reset_color%}➜ :%{$fg_bold[red]%}➜ )"
    PROMPT+='%{$fg_bold[blue]%}%~%{$reset_color%} $(git_prompt_info)%{$fg[white]%} %{$reset_color%}'
}
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}(%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✗%{$fg_bold[cyan]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[cyan]%})"
prompt
