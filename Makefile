install:
	cp -rf `pwd`/.emacs.d ~/

reverse-install:
	cp -rf ~/.emacs.d/* `pwd`/.emacs.d/

creating-custom-file:
	touch ~/.emacs.d/custom.el
