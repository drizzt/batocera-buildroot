################################################################################
#
# compsize
#
################################################################################

# batocera (update)
COMPSIZE_VERSION = 1.5
COMPSIZE_SITE = $(call github,kilobyte,compsize,v$(COMPSIZE_VERSION))
COMPSIZE_DEPENDENCIES = btrfs-progs
COMPSIZE_LICENSE = GPL-2.0+
COMPSIZE_LICENSE_FILES = LICENSE

define COMPSIZE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
endef

define COMPSIZE_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install \
		PREFIX=$(TARGET_DIR)/usr
endef

$(eval $(generic-package))
