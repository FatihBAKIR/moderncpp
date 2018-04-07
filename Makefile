all: posts glossary

posts:
	$(MAKE) -C posts

glossary: 
	$(MAKE) -C glossary

.PHONY: glossary posts

