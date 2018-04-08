ADOC_FLAGS= -a nofooter -n -a linkcss
BUILD_DIR=docs

all: $(BUILD) posts reference blog $(BUILD_DIR)/index.html $(BUILD_DIR)/moderncpp.html

$(BUILD_DIR)/index.html: index.adoc
	asciidoctor index.adoc $(ADOC_FLAGS) -o ./$(BUILD_DIR)/index.html 

$(BUILD_DIR)/moderncpp.html: moderncpp.adoc
	asciidoctor moderncpp.adoc $(ADOC_FLAGS) -o ./$(BUILD_DIR)/moderncpp.html 

posts:
	$(MAKE) -C posts BUILD=../$(BUILD_DIR)/posts ADOC_FLAGS="$(ADOC_FLAGS)"

blog:
	$(MAKE) -C blog BUILD=../$(BUILD_DIR)/blog ADOC_FLAGS="$(ADOC_FLAGS)"

reference: 
	$(MAKE) -C reference BUILD=../$(BUILD_DIR)/reference ADOC_FLAGS="$(ADOC_FLAGS)"

.PHONY: reference posts blog

clean:
	rm -rf $(BUILD_DIR)
