export LANG=zh_CN.UTF-8
export PATH="$HOME/.cargo/bin:$PATH"

export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

if [[ $TERM_PROGRAM = "Apple_Terminal" ]]
then
    [ -x /usr/local/bin/elvish ] && SHELL=/usr/local/bin/elvish exec /usr/local/bin/elvish
elif [[ $TERM_PROGRAM != "vscode" ]]
then
    [ -x /usr/local/bin/tmux ] && SHELL=/usr/local/bin/elvish exec\
        bash $HOME/.dotfiles/tmux.start.sh
fi
