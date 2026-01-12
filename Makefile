# Makefile for managing dotfiles with GNU Stow

# Configuration
STOW_BIN := stow
TARGET_HOME := $(HOME)
TARGET_SCRIPTS := $(HOME)/work_space/scripts

# Packages that go to the home directory
PACKAGES := config emacs gitconfig tmux vim xbindkeys Xwin zsh

.PHONY: all
all: help

# Main install target (stows everything)
install: $(PACKAGES) scripts

# Individual package targets
# Allows running 'make vim', 'make zsh', etc.
$(PACKAGES):
	$(STOW_BIN) -t $(TARGET_HOME) $@

# Scripts target (special location)
scripts:
	@mkdir -p $(TARGET_SCRIPTS)
	$(STOW_BIN) -t $(TARGET_SCRIPTS) scripts

# Clean targets
.PHONY: clean $(addprefix clean-,$(PACKAGES)) clean-scripts

clean: $(addprefix clean-,$(PACKAGES)) clean-scripts

$(addprefix clean-,$(PACKAGES)):
	$(STOW_BIN) -t $(TARGET_HOME) -D $(patsubst clean-%,%,$@)

clean-scripts:
	$(STOW_BIN) -t $(TARGET_SCRIPTS) -D scripts

# Help
help:
	@echo "Dotfiles Manager"
	@echo "================"
	@echo "Usage:"
	@echo "  make                : Stow all packages"
	@echo "  make install        : Stow all packages"
	@echo "  make <package>      : Stow a specific package (e.g., 'make vim')"
	@echo "  make scripts        : Stow scripts to $(TARGET_SCRIPTS)"
	@echo "  make clean          : Unstow all packages"
	@echo "  make clean-<package>: Unstow a specific package (e.g., 'make clean-vim')"
	@echo ""
	@echo "Available packages: $(PACKAGES) scripts"
