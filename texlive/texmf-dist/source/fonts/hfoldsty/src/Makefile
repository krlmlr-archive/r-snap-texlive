all:	t1hfor.fd

t1hfor.fd: generate.sh TS1.etx dostretch.mtx t19.etx
	./generate.sh

clean:
	@rm -f *.vpl *.log ec*.mtx tc*.mtx *.pl hfo*.tex

distclean: clean
	@rm -f *~
	@rm -f *.tfm *.vf *.fd
