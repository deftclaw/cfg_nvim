#!/bin/bash

function progress_indi() {
  PERPLUGIN=227
  plug_count=$(wc plugins/list|awk '{print $1}')
  end_length=$(echo "$PERPLUGIN * $plug_count"|bc)

  function current_count() {
    wc /tmp/nvim_plugins.log|awk '{print $1}'
  }

  echo -e "Loading...\n"
  while [[ $(current_count) -lt $end_length ]]
  do
    printf "\033[1A\033[1000D"
    printf "scale=4; 100 * ($(current_count) / $end_length)"|bc -l|sed 's/0\+$/%/'
    sleep 0.3
  done
}
