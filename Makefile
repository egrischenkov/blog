# Defining variables for all scripts
SCRIPTS_DIR := scripts
CODEGEN_SCRIPT := $(SCRIPTS_DIR)/build_runner.sh
SPIDER_BUILD_SCRIPT := $(SCRIPTS_DIR)/spider_build.sh
GEN_L10N_SCRIPT := $(SCRIPTS_DIR)/gen_l10n.sh

# Tasks to run each script
codegen:
	sh $(CODEGEN_SCRIPT)

spider:
	sh $(SPIDER_BUILD_SCRIPT)

l10n:
	sh $(GEN_L10N_SCRIPT)

# By default, we display a message about available tasks
help:
	@echo "Available tasks:"
	@echo " - codegen: build_runner build & dart format 120"
	@echo " - spider: Runs spider build, formats the code, runs golden tests."
	@echo " - l10n: Generates localizations' files"
	
