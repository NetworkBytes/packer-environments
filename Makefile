
TEMPLATESDIR=./templates

# Packer executable
PACKEREXE=../packer

projs := $(notdir $(basename $(wildcard $(TEMPLATESDIR)/*.json)))
cmds := validate inspect build fix
aliases := bootstrap rebuild

# Enable packer debug logging
PACKER_LOG := 1
PACKER_LOG_PATH := /tmp/packer-debug

export PACKER_LOG PACKER_LOG_PATH

# call out rules that don't generate output
.PHONY: clean deps \
	$(cmds) $(foreach proj,$(projs), $(addsuffix -$(proj),$(cmds))) \
	all $(projs)

helptext:
	@echo "No target supplied. use 'make <command>-<templatename>'\n\n"
	@echo "List of possble commands:\n" $(foreach cmd,$(cmds), "$(cmd)\n")
	@echo "List of possble templates:\n" $(foreach proj,$(projs), "$(proj)\n")


# dep management tasks
#clean:
#	@rm -rf cookbooks

#deps: cookbooks

#cookbooks:
#	@berks vendor $@

# auto-define global and per-proj rules for packer commands
define packer_cmd_rules
$1: $(addprefix $1-,$(projs))
$(addprefix $1-,$(projs)):
	@$(PACKEREXE) $1 $$(addsuffix .json,$$(subst $1-,,$$@))
endef

$(foreach cmd,$(cmds), $(eval $(call packer_cmd_rules,$(cmd))))

# auto generate global and per-proj fast-builds
all: $(projs)

$(projs):
	$(PACKEREXE) build \
		$(TEMPLATESDIR)/$(addsuffix .json, $@)