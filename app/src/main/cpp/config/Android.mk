# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CPP_EXTENSION := .cpp .cc

LOCAL_CPPFLAGS   := -fPIC -std=c++11 -D__ANDROID__
LOCAL_MODULE     := termux_sdl

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../SDL2/include \
                    $(LOCAL_PATH)/../SDL2_image \
                    $(LOCAL_PATH)/../SDL2_mixer \
                    $(LOCAL_PATH)/../SDL2_net \
                    $(LOCAL_PATH)/../SDL2_ttf \
                    $(LOCAL_PATH)/../SDL2_gfx \
                    $(LOCAL_PATH)/../ffplay/include/libavutil
                   


LOCAL_SRC_FILES  := main.cpp 

LOCAL_SHARED_LIBRARIES := SDL2 SDL2_image SDL2_mixer SDL2_net SDL2_ttf SDL2_gfx         
LOCAL_LDLIBS := -lz -llog

ifeq ($(TARGET_ARCH_ABI),x86)
    LOCAL_CFLAGS += -ffast-math -mtune=atom -mssse3 -mfpmath=sse
endif

include $(BUILD_SHARED_LIBRARY)

