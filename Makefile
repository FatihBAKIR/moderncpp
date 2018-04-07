all: posts glossary

posts:
	$(MAKE) -C posts

glossary: 
	$(MAKE) -C glossary BUILD=../build/glossary

.PHONY: glossary posts

