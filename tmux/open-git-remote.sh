#!/bin/bash
cd $(tmux run "echo #{pane_start_path}")
url=$(git remote get-url origin)

xdg-open $url || echo "Couldn't fetch remote url"
