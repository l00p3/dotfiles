# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# --- THEME ---
ZSH_THEME="powerlevel10k/powerlevel10k"



# --- OhMyZSH standard options ---

# Preferred editor for local and remote sessions
EDITOR="vim"
VISUAL="vim"
GIT_EDITOR="vim"



# --- PLUGINS ---
plugins=(
	git
	zsh-autosuggestions
  z
	copypath
)

source $ZSH/oh-my-zsh.sh


# --- ENV VARIABLES ---
# export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/



# --- ALIASES ---
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias gs='git status'
alias ga='git add --all'
alias gc='git commit'
alias gppb='git pull --rebase'
alias prettygit='git log --all --decorate --oneline --graph'
alias ckb='cmake -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && cmake --build build -j$(nproc --all)'
alias ktm="exit"
alias dormi="gnome-screensaver-command -l"
alias muori="sudo shutdown now"
alias install="sudo apt install"
alias update="sudo apt update && sudo apt dist-upgrade"
alias mux="tmuxinator"
alias meheref="rm -rf"
alias c="clear"
alias casa="cd && c"



# --- ROS2 (Humble) ---
# Comment this to true value if you want to use ROS1
# ROS ALIASES
# alias roscdhome="roscd && cd .."

# To use Turtlebot 3 simulator with NAV2
# export TURTLEBOT3_MODEL=waffle
# export GAZEBO_MODEL_PATH=/opt/ros/humble/share/turtlebot3_gazebo/models

# Load the ROS workspace
source /opt/ros/humble/setup.zsh

# My current ROS workspace(s)
# source ~/Workspace/ros2_ws/install/setup.zsh

# COLCON_CD
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=~/Workspace/ros2_ws/

# COLCON tab completion
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh

# Autocomplete
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"

# Useful to start gazebo
# export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# When launching rtabmap_ros's nodes, if you have the error error while loading 
# shared libraries..., try ldconfig or add the next line at the end of 
# your ~/.bashrc to fix it:
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ros/noetic/lib/x86_64-linux-gnu



# --- GAZEBO PLUGINS ---
export IGN_GAZEBO_SYSTEM_PLUGIN_PATH=/home/luca/source/gazebo_plugins/RGLGazeboPlugin/install/RGLServerPlugin:$IGN_GAZEBO_SYSTEM_PLUGIN_PATH
export IGN_GUI_PLUGIN_PATH=/home/luca/source/gazebo_plugins/RGLGazeboPlugin/install/RGLVisualize:$IGN_GUI_PLUGIN_PATH
export RGL_PATTERNS_DIR=/home/luca/source/gazebo_plugins/RGLGazeboPlugin/lidar_patterns



# --- OpenBLAS ---
# To allow to use openBLAS to OverFeat
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/OpenBLAS/lib/



# --- CUDA ---
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export PATH=/usr/local/cuda/bin:$PATH



# TODO: figure it out this
# Add python packages path to PYTHONPATH (for some reason it is not there)
# export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.10/site-packages



# --- pyenv ---
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
