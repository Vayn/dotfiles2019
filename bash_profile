export LANG=zh_CN.UTF-8
export PATH="$HOME/.cargo/bin:$PATH"

export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

#[ -x /usr/local/bin/elvish ] && SHELL=/usr/local/bin/elvish exec /usr/local/bin/elvish
[ -x /usr/local/bin/tmux ] && SHELL=/usr/local/bin/elvish exec tmux new-session -A -s _default