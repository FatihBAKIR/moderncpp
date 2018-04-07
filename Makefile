ADOC_FLAGS= -a nofooter

all: posts glossary index

index:
	asciidoctor index.adoc $(ADOC_FLAGS) -o ./build/index.html 

posts:
	$(MAKE) -C posts BUILD=../build/posts ADOC_FLAGS="$(ADOC_FLAGS)"

glossary: 
	$(MAKE) -C glossary BUILD=../build/glossary ADOC_FLAGS="$(ADOC_FLAGS)"

.PHONY: glossary posts

clean:
	rm -rf build
