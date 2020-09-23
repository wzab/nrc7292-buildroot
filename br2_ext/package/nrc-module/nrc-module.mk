################################################################################
#
# nrc-module
#
################################################################################

MODNAME=NRC_MODULE
${MODNAME}_VERSION = 1.0
${MODNAME}_SITE    = $(BR2_EXTERNAL_WZAB_PATH)/src/nrc
${MODNAME}_SITE_METHOD = local
${MODNAME}_LICENSE = LGPLv2.1/GPLv2 

$(eval $(kernel-module))
$(eval $(generic-package))
