#
# Makefile
#
# Version:	$Id$
#

include ../../Make.inc

WHAT_TO_MAKE	= all

all:
	@$(MAKE) $(MFLAGS) WHAT_TO_MAKE=$@ common

install:
	$(INSTALL) -d -m 755 $(R)$(libdir)
	@$(MAKE) $(MFLAGS) WHAT_TO_MAKE=$@ common

clean:
	@$(MAKE) $(MFLAGS) WHAT_TO_MAKE=$@ common
	@rm -f *~ lib/rlm_* lib/*.o lib/smbencrypt lib/radeapclient

distclean:
	@$(MAKE) $(MFLAGS) WHAT_TO_MAKE=$@ common

#
#  Do NOT use "common", because some modules may not be built,
#  and therefore their makefiles may be empty or non-existent.
#
reconfig:
	@[ "x$(AUTOCONF)" != "x" ] || exit 0
	@[ "x$(AUTOHEADER)" != "x" ] || exit 0
	@for x in `find . -name "configure.in" -print`; do \
		( \
		 cd `dirname $$x` || exit $$?; \
		 if [ -f configure.in ]; then \
			$(AUTOCONF) -I $(top_builddir); \
		 fi; \
		 if grep AC_CONFIG_HEADERS configure.in >/dev/null; then\
			$(AUTOHEADER); \
		 fi; \
		)  || exit $$?; \
	done

common:
	@[ -d lib/ ] || mkdir lib
	@[ -d lib/.libs ] || mkdir lib/.libs
	@for mod in $(MODULES); do \
		if [ -d $$mod ] && [ -f $$mod/Makefile ]; then \
			echo "Making $(WHAT_TO_MAKE) in $$mod..."; \
			$(MAKE) $(MFLAGS) -C $$mod $(WHAT_TO_MAKE) || exit $$?; \
		fi; \
	done

.PHONY: scan
scan:
	@[ "$(SCAN_BUILD)" == "" ] || ($(MAKE) SCAN=yes LIBTOOL= WHAT_TO_MAKE=scan common 2>&1) | grep 'scan-build' || true
