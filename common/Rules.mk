RM	= rm -rf
CP	= cp -raf
PATCH	= patch
MAKE	= make
MKDIR	= mkdir

ECHO	= echo '${NAME}:'

PATCHDIR= $${PWD}/patches
PATCHES	= $(shell echo ${PATCHDIR}/*)

FILEDIR	= $${PWD}/files
FILES	= $(shell echo ${FILEDIR}/*)

BUILD	= $${PWD}/build
REPO	= $${PWD}/repo

.PHONY: all install clean

all: build build/.copy build/.patch
	@${MAKE} -C build

install: all
	@${MAKE} -C build install

build: repo/.git
	@${ECHO} "Cleaning and reseting repository..."
	@cd ${REPO}; git reset HEAD; git clean -f
	@${ECHO} "Creating build directory..."
	@${MKDIR} ${BUILD}
	@${ECHO} "Copying contents of repository..."
	@${CP} ${REPO}/* ${BUILD}/

repo/.git:
	@${ECHO} 'Submodule has not been initialized.'
	@${ECHO} 'Try running `make pull` from the project directory.'
	@${ECHO} 'Bailing...'
	@false

build/.copy: ${FILES}
	@touch ${BUILD}/.copy
	@for file in ${FILES}; do \
		${ECHO} "Copying $$file into build dir..."; \
		[[ -e "$$file" ]] && \
			${ECHO} "File exists. Clobbering..."; \
		${CP} "$$file" ${BUILD}; \
	done

build/.patch: ${PATCHES}
	@touch ${BUILD}/.patch
	@for patch in ${PATCHES}; do \
		target="${BUILD}/`basename $${patch%.diff}`"; \
		${ECHO} "`patch $$target < $$patch`"; \
	done

clean:
	@${ECHO} 'RM build'
	@${RM} ${BUILD}
	@for file in $(filter-out %.diff,$(shell echo ${PATCHDIR}/*)); do \
		${ECHO} "RM $$file"; \
                ${RM} "$$file"; \
	done
