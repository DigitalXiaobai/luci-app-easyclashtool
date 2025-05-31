include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-easyclashtool
PKG_VERSION:=1.0
PKG_MAINTAINER:=ChenhyPVZ
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/luci.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=Clash.Meta LuCI Plugin
  DEPENDS:=+luci-base +curl +ip-full +iptables +ca-certificates
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/easyclashtool $(1)/etc/init.d/easyclashtool
	$(INSTALL_DIR) $(1)/usr/share/easyclashtool
	$(INSTALL_DATA) ./root/usr/share/easyclashtool/* $(1)/usr/share/easyclashtool/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./luasrc/controller/easyclashtool.lua $(1)/usr/lib/lua/luci/controller/easyclashtool.lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/easyclashtool
	$(INSTALL_DATA) ./luasrc/model/cbi/easyclashtool/*.lua $(1)/usr/lib/lua/luci/model/cbi/easyclashtool/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))