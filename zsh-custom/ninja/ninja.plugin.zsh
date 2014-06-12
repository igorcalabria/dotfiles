p() { cd ~/dev/$1; }
_p() { _files -W ~/dev -/; }
compdef _p p

s() { vimx ~/.oh-my-zsh/custom/plugins/$1; }
_s() { _files -W ~/.oh-my-zsh/custom/plugins -/; }
compdef _s s

v() { vimx ~/.vimrc; }

f() { 
  cd ~/.firefox/addon-sdk
  source bin/activate
  cd -
}

i() {
  CURRENT_SESSION=${PWD##*/}
  if [[ -z $TMUX ]] then
    tmux new-session -d -s $CURRENT_SESSION
  fi

  tmux send-keys 'cmus' 'C-m'
  tmux split-window -h

  if [[ -z $TMUX ]] then
    tmux attach -t $CURRENT_SESSION
  fi
}

ninja-rails() {
  CURRENT_SESSION=${PWD##*/}
  if [[ ! -f Rakefile ]] then
    print  "Rakefile not found in current dir"
  else

    if [[ -z $TMUX ]] then
      tmux new-session -d -s $CURRENT_SESSION
    fi

    tmux send-keys 'vimx' 'C-m'
    tmux new-window
    # tmux send-keys 'rails server' 'C-m'
    tmux split-window -v
    # tmux send-keys 'bundle exec guard' 'C-m'
    tmux split-window -h
    # tmux send-keys 'rails console' 'C-m'
    tmux select-pane -U
    tmux split-window -h

    if [[ -z $TMUX ]] then
      tmux attach -t $CURRENT_SESSION
    fi
  fi
}
