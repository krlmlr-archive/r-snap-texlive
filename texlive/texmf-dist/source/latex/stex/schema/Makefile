MAKEDIRS = rnc rng
CLEANDIRS = rnc rng

all::
	@for d in $(MAKEDIRS);\
	  do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;

clean distclean::
	@for d in $(CLEANDIRS);\
	  do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;

