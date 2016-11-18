#!/usr/bin/env bash
#
# kevinkjt2000/tmux ellipsis package

pkg.install() {
  git submodule update --init --recursive
}

pkg.link() {
  fs.link_file tmux.conf 
  mkdir -p ~/.tmux/plugins
  fs.link_file tmux/plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins
}

pkg.pull() {
  git.pull
  git submodule update --recursive --remote
  ~/.tmux/plugins/tpm/bin/install_plugins
}
