# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
z
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ------------------------------------------------------------------->>>>>>>>>>
# ??????????????????
# ------------------------------------------------------------------->>>>>>>>>>
unset R_HOME
HOME=/lustre1/chengqiyi_pkuhpc/zhaohn
# ------------------------------------------------------------------->>>>>>>>>>
# PATH ????????????
# ------------------------------------------------------------------->>>>>>>>>>
# PATH update
# ??????????????????
export PATH=/usr/bin
# slurm ????????????
export PATH=$PATH:/rm/rm_prog/slurm/18.08.7/bin:/data01/oldbin/newbin
# ??????????????????
export PATH=$PATH:${HOME}/.local/bin
export PATH=$PATH:${HOME}/.cargo/bin
# ?????????????????????
export PATH=$PATH:${HOME}/0.apps/bin
export PATH=$PATH:${HOME}/0.apps/homer/bin
export PATH=$PATH:${HOME}/0.apps/HiC-Pro_installed/HiC-Pro_3.1.0/bin
export PATH=$PATH:${HOME}/0.apps/hisat-3n_allType
# ------------------------------------------------------------------->>>>>>>>>>
# ?????????????????????
# ------------------------------------------------------------------->>>>>>>>>>
# mv????????????rm??????
trash()
{
    mv $@ ~/4.trash/
}

# ??????????????????????????????
trashlist()
{
    ls -alt ~/4.trash/*
}

# ???????????????????????????
undelfile()
{
    mv -i ~/4.trash/* ./
}
# ???????????????
cleartrash()
{
    echo "?????????????????????????????????????????? ~/4.trash [y/n]"
    read confirm
    if [ ${confirm} = "y"  ] ;then
        /bin/rm -rf ~/4.trash/*
        /bin/rm -rf ~/4.trash/.* 2>/dev/null
    fi
}


# ------------------------------------------------------------------->>>>>>>>>>
# ?????????alias
# ------------------------------------------------------------------->>>>>>>>>>
# ????????????
alias del='trash'
alias dellist='trashlist'
alias delback='undelfile'
alias delclear='cleartrash'
# ??????????????????
alias sshabyss.ssh="ssh zhaohuanan@162.105.250.207"
alias sshknight.ssh="ssh menghw@202.205.131.32"
alias sshknight.ssh2="ssh menghw@202.205.131.33"
# ?????????????????????
alias ll="exa -lh"
alias l="exa -lha"
# slurm????????????
alias squeuekillall="squeue | grep \"ZhnSnake\" | awk -F \" \" '{print \"scancel \"\$1}' | sh"
alias squeuez="for i in \`squeue | grep chengqi| grep -v 'QOS not permitted' | awk '{print \$1}'\`; do (pkujob | grep \$i | xargs echo); done | grep zhaohn | awk -F '=' '{print \$2}' | awk '{print \$1}'"
alias squeuey="squeue | grep chengqi | grep -v 'QOS not permitted'"
alias ps-ef="ps -ef | grep chengqi | grep zhaohn"
# Bioinformatic tools
alias checkbam="for i in *.bam ;do (samtools quickcheck \$i && echo \"ok    \" \$i || echo \"error    \" \$i);done"

# ------------------------------------------------------------------->>>>>>>>>>
# Conda | Mamba (Must be at the end)
# ------------------------------------------------------------------->>>>>>>>>>
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/lustre1/chengqiyi_pkuhpc/zhaohn/0.apps/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/lustre1/chengqiyi_pkuhpc/zhaohn/0.apps/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/lustre1/chengqiyi_pkuhpc/zhaohn/0.apps/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/lustre1/chengqiyi_pkuhpc/zhaohn/0.apps/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

