  # Copyright (c) 2013 Bilibili
  # copyright (c) 2013 Zhang Rui <bbcallen@gmail.com>
  #
  # This file is part of ijkPlayer.
  #
  # ijkPlayer is free software; you can redistribute it and/or
  # modify it under the terms of the GNU Lesser General Public
  # License as published by the Free Software Foundation; either
  # version 2.1 of the License, or (at your option) any later version.
  #
  # ijkPlayer is distributed in the hope that it will be useful,
  # but WITHOUT ANY WARRANTY; without even the implied warranty of
  # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  # Lesser General Public License for more details.
  #
  # You should have received a copy of the GNU Lesser General Public
  # License along with ijkPlayer; if not, write to the Free Software
  # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

  LOCAL_PATH := $(call my-dir)

  MY_APP_JNI_ROOT := $(realpath $(LOCAL_PATH))
  MY_APP_PRJ_ROOT := $(realpath $(MY_APP_JNI_ROOT)/..)
  MY_APP_ANDROID_ROOT := $(realpath $(MY_APP_PRJ_ROOT)/../../../..)
  IJKPLAYER_ANDROID_IJKPLAYER_ROOT := $(realpath $(MY_APP_PRJ_ROOT)/../../..)

  MY_TOTAL_IJK_ROOT := $(realpath $(MY_APP_ANDROID_ROOT)/..)
  MY_IJKMEDIA_ROOT := $(realpath $(MY_TOTAL_IJK_ROOT)/ijkmedia)

   $(warning "the value of TARGET_ARCH_ABI is $(TARGET_ARCH_ABI)")

  ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
  MY_APP_FFMPEG_OUTPUT_PATH := $(realpath $(MY_APP_ANDROID_ROOT)/contrib/build/ffmpeg-armv7a/output)
  MY_APP_FFMPEG_INCLUDE_PATH := $(realpath $(MY_APP_FFMPEG_OUTPUT_PATH)/include)
  endif
  ifeq ($(TARGET_ARCH_ABI),armeabi)
  MY_APP_FFMPEG_OUTPUT_PATH := $(realpath $(MY_APP_ANDROID_ROOT)/contrib/build/ffmpeg-armv5/output)
  MY_APP_FFMPEG_INCLUDE_PATH := $(realpath $(MY_APP_FFMPEG_OUTPUT_PATH)/include)
  endif
  ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
  MY_APP_FFMPEG_OUTPUT_PATH := $(realpath $(MY_APP_ANDROID_ROOT)/contrib/build/ffmpeg-arm64/output)
  MY_APP_FFMPEG_INCLUDE_PATH := $(realpath $(MY_APP_FFMPEG_OUTPUT_PATH)/include)
  endif
  ifeq ($(TARGET_ARCH_ABI),x86)
  MY_APP_FFMPEG_OUTPUT_PATH := $(realpath $(MY_APP_ANDROID_ROOT)/contrib/build/ffmpeg-x86/output)
  MY_APP_FFMPEG_INCLUDE_PATH := $(realpath $(MY_APP_FFMPEG_OUTPUT_PATH)/include)
  endif
  ifeq ($(TARGET_ARCH_ABI),x86_64)
  MY_APP_FFMPEG_OUTPUT_PATH := $(realpath $(MY_APP_ANDROID_ROOT)/contrib/build/ffmpeg-x86_64/output)
  MY_APP_FFMPEG_INCLUDE_PATH := $(realpath $(MY_APP_FFMPEG_OUTPUT_PATH)/include)
  endif

 $(warning "the value of MY_APP_FFMPEG_OUTPUT_PATH is $(MY_APP_FFMPEG_OUTPUT_PATH)")
 $(warning "the value of MY_APP_FFMPEG_INCLUDE_PATH is $(MY_APP_FFMPEG_INCLUDE_PATH)")

  IJKMEDIA_MAKEFILE := $(realpath $(MY_IJKMEDIA_ROOT)/Android.mk)
  FFMPEG_MAKEFILE := $(realpath $(IJKPLAYER_ANDROID_IJKPLAYER_ROOT)/android-make-files/ffmpeg/Android.mk)
  ANDROID_NDK_PROFILER_DUMMY_MAKEFILE := $(realpath $(MY_TOTAL_IJK_ROOT)/ijkprof/android-ndk-profiler-dummy/jni/Android.mk)

  $(warning "the value of MY_APP_PRJ_ROOT is $(MY_APP_PRJ_ROOT)")
  $(warning "the value of MY_APP_ANDROID_ROOT is $(MY_APP_ANDROID_ROOT)")
  $(warning "the value of IJKPLAYER_ANDROID_IJKPLAYER_ROOT is $(IJKPLAYER_ANDROID_IJKPLAYER_ROOT)")
  $(warning "the value of IJKMEDIA_MAKEFILE is $(IJKMEDIA_MAKEFILE)")
  $(warning "the value of FFMPEG_MAKEFILE is $(FFMPEG_MAKEFILE)")
  $(warning "the value of ANDROID_NDK_PROFILER_DUMMY_MAKEFILE is $(ANDROID_NDK_PROFILER_DUMMY_MAKEFILE)")

  include $(IJKMEDIA_MAKEFILE)
  include $(FFMPEG_MAKEFILE)
  include $(ANDROID_NDK_PROFILER_DUMMY_MAKEFILE)

  #include $(call all-subdir-makefiles)
