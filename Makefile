.PHONY: zwc clean compile tests install uninstall docs

ZSH := $(shell command -v zsh 2> /dev/null)

# Compile to zwc
zwc:
	$(ZSH) -fc 'for f in *.zsh-theme *.zsh lib/*.zsh sections/*.zsh; do zcompile -R -- $$f.zwc $$f || exit; done'

# Clean up zwc
clean:
	find . -name "*.zwc" -type f -delete

# Compile everything
compile: zwc

# Run all tests with a nice reporer
tests:
	./scripts/tests

# Link spaceship to site-functions
install:
	./scripts/install

# Unlink spaceship from site-functions
uninstall:
	./scripts/uninstall

# Serve the docs
docs:
	@mkdocs serve
