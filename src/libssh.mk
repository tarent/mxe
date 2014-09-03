# This file is part of MXE.
# See index.html for further information.

PKG             := libssh
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.6.3
$(PKG)_CHECKSUM := 8189255e0f684d36b7ca62739fa0cd5f1030a467
$(PKG)_SUBDIR   := libssh-$($(PKG)_VERSION)
$(PKG)_FILE     := libssh-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://red.libssh.org/attachments/download/87/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc zlib openssl pthreads

define $(PKG)_BUILD
    mkdir '$(1)/build'
    cd '$(1)/build' && cmake ../ \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DWITH_GCRYPT=OFF \
        -DWITH_STATIC_LIB=$(if $(BUILD_SHARED),OFF,ON)
    $(MAKE) -C '$(1)/build' -j 1 install
endef
