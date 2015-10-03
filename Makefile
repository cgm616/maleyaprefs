include theos/makefiles/common.mk

BUNDLE_NAME = MaleyaPrefs
MaleyaPrefs_FILES = MaleyaPrefs.mm
MaleyaPrefs_INSTALL_PATH = /Library/PreferenceBundles
MaleyaPrefs_FRAMEWORKS = UIKit
MaleyaPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MaleyaPrefs.plist$(ECHO_END)
