#!/usr/bin/env bash
#
# kevinkjt2000/tmux ellipsis package

pkg.install() {
	git submodule update --init
}

pkg.link() {
	fs.link_file tmux.conf
	mkdir -p ~/.tmux/plugins
	fs.link_file tmux/plugins/tpm ~/.tmux/plugins/tpm
	fs.link_file tmux/tmuxline-snapshot.conf ~/.tmux/tmuxline-snapshot.conf
	~/.tmux/plugins/tpm/bin/install_plugins
}

pkg.pull() {
	git.pull
	git submodule update --remote
	~/.tmux/plugins/tpm/bin/clean_plugins
	~/.tmux/plugins/tpm/bin/install_plugins
	~/.tmux/plugins/tpm/bin/update_plugins all
}
