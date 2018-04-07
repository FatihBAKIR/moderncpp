SUBDIRS = fatih

THIS_MAKEFILE = $(CURDIR)/../DirMakefile

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ --file=$(THIS_MAKEFILE) BUILD="../$(BUILD)/$@" ADOC_FLAGS="$(ADOC_FLAGS)" all

.PHONY: $(SUBDIRS)

