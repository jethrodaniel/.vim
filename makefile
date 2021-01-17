build: prereqs build/v8.2.2373
	cd build/vim-8.2.2373 && ./configure --enable-rubyinterp --enable-pythoninterp --with-features=huge --enable-multibyte --with-x --enable-gui && \
	make && sudo make install
	rm -rf build
build/v8.2.2373: build/v8.2.2373.tar.gz
	tar xzvf build/v8.2.2373.tar.gz -C build
build/v8.2.2373.tar.gz: build_dir
	wget https://github.com/vim/vim/archive/v8.2.2373.tar.gz -O build/v8.2.2373.tar.gz
build_dir:
	mkdir -p build
prereqs:
	sudo yum install -y gcc git ncurses-devel python python-devel ruby ruby-devel libX11 libX11-devel libXtst libXtst-devel
clean:
	rm -rf build
