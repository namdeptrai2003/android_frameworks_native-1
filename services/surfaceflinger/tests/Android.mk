# Build the unit tests,
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk

LOCAL_MODULE := SurfaceFlinger_test

LOCAL_MODULE_TAGS := tests

LOCAL_SRC_FILES := \
   Transaction_test.cpp \
   Stress_test.cpp \
   SurfaceInterceptor_test.cpp

LOCAL_SHARED_LIBRARIES := \
    libEGL \
    libGLESv2 \
    libbinder \
    libcutils \
    libgui \
    libprotobuf-cpp-full \
    libui \
    libutils \
    libandroid \
    liblog

LOCAL_STATIC_LIBRARIES := libtrace_proto

LOCAL_CFLAGS += -Wall -Werror -Wunused -Wunreachable-code

LOCAL_TEST_DATA = SurfaceFlinger_test.filter

# Build the binary to $(TARGET_OUT_DATA_NATIVE_TESTS)/$(LOCAL_MODULE)
# to integrate with auto-test framework.
include $(BUILD_NATIVE_TEST)

# Include subdirectory makefiles
# ============================================================

# If we're building with ONE_SHOT_MAKEFILE (mm, mmm), then what the framework
# team really wants is to build the stuff defined by this makefile.
ifeq (,$(ONE_SHOT_MAKEFILE))
include $(call first-makefiles-under,$(LOCAL_PATH))
endif
