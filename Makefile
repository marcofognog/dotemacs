install:
	cp `pwd`/.emacs ~/.emacs
	cp -rf `pwd`/.emacs.d ~/

reverse-install:
	cp ~/.emacs `pwd`/.emacs
	cp -rf ~/.emacs.d/* `pwd`/.emacs.d/

creating-custom-file:
	touch ~/.emacs.d/custom.el
