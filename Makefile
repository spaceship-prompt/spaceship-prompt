.PHONY: tests install uninstall docs

# Run all tests with a nice reporer
tests:
	./scripts/tests.sh

# Link spaceship to site-functions
install:
	./scripts/install.sh

# Unlink spaceship from site-functions
uninstall:
	./scripts/uninstall.sh

# Serve the docs
docs:
	@mkdocs serve
