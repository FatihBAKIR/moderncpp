ADOC_FLAGS= -a nofooter -n -a linkcss -a source-highlighter=coderay -a source-language=cpp -a coderay-linenums-mode=inline
BUILD=docs

SUBDIRS= posts blog reference
SUBDIR_OBJS=$(patsubst %, $(BUILD)/%, $(SUBDIRS))

SRC = $(wildcard *.adoc)
OBJ = $(patsubst %.adoc, $(BUILD)/%.html, $(SRC))

$(BUILD)/%.html: %.adoc
	asciidoctor $< $(ADOC_FLAGS) -o $@ 

$(BUILD)/%: %
	$(MAKE) -C $< BUILD=../$@ ADOC_FLAGS="$(ADOC_FLAGS)"

all: $(BUILD) $(OBJ) $(SUBDIR_OBJS)

$(BUILD): 
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)

serve:
	cd docs; python2 -m SimpleHTTPServer 8080

.PHONY: $(SUBDIRS)
