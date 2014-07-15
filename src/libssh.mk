# This file is part of MXE.
# See index.html for further information.

PKG             := libssh
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.5.5
$(PKG)_CHECKSUM := e701476ec43f85178bdb36fbb58aa45417a38f5e
$(PKG)_SUBDIR   := libssh-$($(PKG)_VERSION)
$(PKG)_FILE     := libssh-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://red.libssh.org/attachments/download/51/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc zlib openssl

define $(PKG)_BUILD
    mkdir '$(1)/build'
    cd '$(1)/build' && cmake ../ \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DWITH_GCRYPT=OFF \
        -DWITH_STATIC_LIB=$(if $(BUILD_SHARED),OFF,ON) 
    $(MAKE) -C '$(1)/build' -j 1 install
endef
