################################################################################
#
# cli-app
#
################################################################################
PKGNAME=CLI_APP
_VERSION = 1.0
${PKGNAME}_SITE = $(BR2_EXTERNAL_WZAB_PATH)/src/cli_app
${PKGNAME}_SITE_METHOD = local
${PKGNAME}_DEPENDENCIES = ncurses

define ${PKGNAME}_BUILD_CMDS
   $(MAKE) $(TARGET_CONFIGURE_OPTS) all -C $(@D)
endef
define ${PKGNAME}_INSTALL_TARGET_CMDS 
   $(INSTALL) -D -m 0755 $(@D)/cli_app $(TARGET_DIR)/usr/bin 
endef
${PKGNAME}_LICENSE = Proprietary

$(eval $(generic-package))
