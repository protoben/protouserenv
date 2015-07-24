MAKE	= make

.PHONY: all install clean pull

all:
	@for dir in `find -mindepth 1 -maxdepth 1 -path './.git' -prune \
					       -o -path './*-temp' -prune \
					       -o -type d -print`; do \
		${MAKE} -C "$$dir"; \
	done

install:
	@for dir in `find -mindepth 1 -maxdepth 1 -path './.git' -prune \
					       -o -path './*-temp' -prune \
					       -o -type d -print`; do \
		${MAKE} -C "$$dir" install; \
	done

clean:
	@for dir in `find -mindepth 1 -maxdepth 1 -path './.git' -prune \
					       -o -path './*-temp' -prune \
					       -o -type d -print`; do \
		${MAKE} -C "$$dir" clean; \
	done

pull:
	@echo "Pulling from repo..."
	@git pull
	@echo "Initializing and updating submodules..."
	@git submodule update --init
