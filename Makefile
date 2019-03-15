include $(TOPDIR)/rules.mk

PKG_NAME:=jmuEportalAuth
PKG_VERSION=0.1.0
PKG_RELEASE:=0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/jmuEportalAuth
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=jmuEportalAuth
	DEPENDS:=+curl +libcurl
	PKGARCH:=all
endef

define Package/jmuEportalAuth/description
	This package contains jmuEportalAuth execution file.
endef

define Package/jmuEportalAuth/conffiles
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/jmuEportalAuth/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) ./files/root/bin/jmuEportalAuth $(1)/bin/jmuEportalAuth
endef

$(eval $(call BuildPackage,jmuEportalAuth))