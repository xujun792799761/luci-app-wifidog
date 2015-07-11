#PO = wifidog
#by walkingsky

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-wifidog
PKG_VERSION:=1.0
PKG_RELEASE:=1
LUCI_DIR:=/usr/lib/lua/luci

include $(INCLUDE_DIR)/package.mk
define Package/luci-app-wifidog  
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  DEPENDS:= +wifidog-gateway luci
  TITLE:=wifidog luci control interface(by walkingsky)
endef
define Build/Compile
endef

define Build/Configure
endef


define Package/luci-app-wifidog/install
    	$(INSTALL_DIR) $(1)/etc/config
	$(CP) ./files/etc/config/* $(1)/etc/config/
	$(INSTALL_DIR) $(1)/etc/init.d	
	$(INSTALL_BIN) ./files/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc/uci-defaults	
	$(INSTALL_BIN) ./files/etc/uci-defaults/* $(1)/etc/uci-defaults/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/usr/sbin/* $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) ./files/usr/lib/* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,luci-app-wifidog))
