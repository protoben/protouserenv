LN	= ln
LNFLAGS	= -f

.PHONY: all install dotfiles bin

all:

install: dotfiles bin

dotfiles:
	@find dotfiles -mindepth 1 -maxdepth 1 \
	  -type f -execdir bash -c \
	    'dst="$${HOME}/.`basename $$1`"; \
	    echo "LN dotfiles/`basename "$$1"` $$dst"; \
	    ${LN} ${LNFLAGS} "$$1" "$$dst"' - '{}' \; \
	  -or -type d -execdir bash -c \
	    'dst="$${HOME}/.`basename $$1`"; \
	    echo "LN dotfiles/`basename "$$1"` $$dst"; \
	    ${LN} ${LNFLAGS} -sr "$$1" "$$dst"' - '{}' \;

bin:
	@-[ ! -d "$${HOME}/bin" ] && mkdir "$${HOME}/bin"
	@for file in bin/*; do \
		echo "LN bin/`basename $$file` $${HOME}/bin/`basename $$file`"; \
		${LN} ${LNFLAGS} "$$file" "$${HOME}/bin/`basename $$file`"; \
	done
