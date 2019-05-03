use epm

epm:install &silent-if-installed=$true \
github.com/zzamboni/elvish-modules     \
github.com/zzamboni/elvish-completions \
github.com/zzamboni/elvish-themes      \
github.com/xiaq/edit.elv               \
github.com/muesli/elvish-libs          \
github.com/iwoloschin/elvish-packages

use re

use readline-binding

edit:insert:binding[Alt-Backspace] = $edit:kill-small-word-left~

edit:insert:binding[Alt-d] = $edit:kill-small-word-right~

use github.com/zzamboni/elvish-modules/alias

alias:new ls e:exa --color-scale --git --group-directories-first
alias:new more less
alias:new vim nvim

use github.com/xiaq/edit.elv/smart-matcher
smart-matcher:apply

use github.com/zzamboni/elvish-completions/vcsh
use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/ssh
use github.com/zzamboni/elvish-completions/builtins

use github.com/zzamboni/elvish-completions/git
git:git-command = git
git:init

use github.com/zzamboni/elvish-completions/comp

use github.com/zzamboni/elvish-themes/chain
chain:bold-prompt = $true

chain:segment-style = [
  &dir=          session
  &chain=        session
  &arrow=        session
  &git-combined= session
]

chain:glyph[git-ahead]  = "⬆ "
chain:glyph[git-staged] = "✔ "

edit:prompt-stale-transform = { each [x]{ styled $x[text] "gray" } }

edit:-prompt-eagerness = 10

use github.com/zzamboni/elvish-modules/long-running-notifications

use github.com/zzamboni/elvish-modules/bang-bang

use github.com/zzamboni/elvish-modules/dir
alias:new cd &use=[github.com/zzamboni/elvish-modules/dir] dir:cd
alias:new cdb &use=[github.com/zzamboni/elvish-modules/dir] dir:cdb

edit:insert:binding[Alt-i] = $dir:history-chooser~

edit:insert:binding[Alt-b] = $dir:left-small-word-or-prev-dir~
edit:insert:binding[Alt-f] = $dir:right-small-word-or-next-dir~

use github.com/zzamboni/elvish-modules/terminal-title

E:LESS = "-i -R"

E:EDITOR = "vim"

E:LC_ALL = "zh_CN.UTF-8"

use github.com/zzamboni/elvish-modules/util

use github.com/muesli/elvish-libs/git

use github.com/iwoloschin/elvish-packages/update
update:curl-timeout = 3
update:check-commit &verbose

use github.com/iwoloschin/elvish-packages/python
alias:new activate python:activate
alias:new deactivate python:deactivate

edit:insert:binding['Ctrl-['] = { edit:location:start }

fn relaunch []{ e:sudo kill -9 (ps -e | grep -e airportd -e SystemUI | grep -v grep | awk '{print $1}') }
fn q []{ exit }

-exports- = (alias:export)
