LN	= ln
LNFLAGS	= -f

.PHONY: all home

all: home

home:
	@find home -mindepth 1 -maxdepth 1 \
	  -type f -execdir bash -c \
	    'dst="$${HOME}/.`basename $$1`"; \
	    echo "LN home/`basename "$$1"` $$dst"; \
	    ${LN} ${LNFLAGS} "$$1" "$$dst"' - '{}' \; \
	  -or -type d -execdir bash -c \
	    'dst="$${HOME}/.`basename $$1`"; \
	    echo "LN home/`basename "$$1"` $$dst"; \
	    ${LN} ${LNFLAGS} -sr "$$1" "$$dst"' - '{}' \;
