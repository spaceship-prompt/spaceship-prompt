.PHONY: tests install uninstall docs

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
