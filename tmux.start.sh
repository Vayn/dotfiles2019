#!/bin/sh
[ "$TMUX" == "" ] || exit 0
tmux has-session -t ONE || tmux new-session -s ONE -d
PS3="Please choose your session: "
options=($(tmux list-sessions -F "#S") "NEW SESSION")
echo "Available sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
    case $opt in
        "NEW SESSION")
            read -p "Enter new session name: " SESSION_NAME
            tmux new -s "$SESSION_NAME"
            break
            ;;
        *)
            tmux attach-session -t ONE
            break
            ;;
    esac
done
