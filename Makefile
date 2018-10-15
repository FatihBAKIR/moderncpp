ADOC_FLAGS= -a nofooter -n -a linkcss -a source-highlighter=coderay -a source-language=cpp -a coderay-linenums-mode=inline
BUILD_DIR=docs

all: $(BUILD) $(BUILD_DIR)/index.html 

$(BUILD_DIR)/index.html: index.adoc $(BUILD_DIR)/moderncpp.html $(BUILD_DIR)/kaynaklar.html posts blog reference
	asciidoctor $< $(ADOC_FLAGS) -o $@ 

$(BUILD_DIR)/%.html: %.adoc
	asciidoctor $< $(ADOC_FLAGS) -o $@ 

posts:
	$(MAKE) -C posts BUILD=../$(BUILD_DIR)/posts ADOC_FLAGS="$(ADOC_FLAGS)"

blog:
	$(MAKE) -C blog BUILD=../$(BUILD_DIR)/blog ADOC_FLAGS="$(ADOC_FLAGS)"

reference: 
	$(MAKE) -C reference BUILD=../$(BUILD_DIR)/reference ADOC_FLAGS="$(ADOC_FLAGS)"

.PHONY: reference posts blog

clean:
	rm -rf $(BUILD_DIR)
