ADOC_FLAGS= -a nofooter -n -a linkcss
BUILD_DIR=docs

all: $(BUILD) posts glossary index

index:
	asciidoctor index.adoc $(ADOC_FLAGS) -o ./$(BUILD_DIR)/index.html 

posts:
	$(MAKE) -C posts BUILD=../$(BUILD_DIR)/posts ADOC_FLAGS="$(ADOC_FLAGS)"

glossary: 
	$(MAKE) -C glossary BUILD=../$(BUILD_DIR)/glossary ADOC_FLAGS="$(ADOC_FLAGS)"

.PHONY: glossary posts

clean:
	rm -rf $(BUILD_DIR)
