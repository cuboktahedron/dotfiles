build:
	@if [ -e ~/.vimrc ]; then \
		rm -f ~/.vimrc; \
	fi

	@if [ -e ~/.gvimrc ]; then \
		rm -f ~/.gvimrc; \
	fi

	@if [ -e ~/.zshrc ]; then \
		rm -f ~/.zshrc; \
	fi

	ln -s ~/dotfiles/_vimrc ~/.vimrc
	ln -s ~/dotfiles/_gvimrc ~/.gvimrc
	ln -s ~/dotfiles/_zshrc ~/.zshrc

