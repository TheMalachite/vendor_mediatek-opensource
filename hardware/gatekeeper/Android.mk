LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libSoftGatekeeper
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_SYMLINKS := gatekeeper.default.so
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk
LOCAL_SRC_FILES := \
    HalAdaptationLayer.cpp \
    module.c

LOCAL_CFLAGS := -Wall -Werror -Wmissing-field-initializers -Wunused-parameter
LOCAL_CPP_STD := c++11
LOCAL_CPPFLAGS += -fpermissive -Wall -Werror -D__STDC_LIMIT_MACROS

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    $(TOPDIR)external/scrypt/lib/crypto \
    $(TOPDIR)system/gatekeeper/include/gatekeeper

LOCAL_SHARED_LIBRARIES += \
    libgatekeeper \
    libhardware \
    libbase \
    libutils \
    libcrypto \
    liblog

LOCAL_STATIC_LIBRARIES := libscrypt_static

include $(BUILD_SHARED_LIBRARY)
