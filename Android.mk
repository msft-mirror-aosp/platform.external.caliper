# Copyright (C) 2015 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

# build caliper host jar
# ============================================================

include $(CLEAR_VARS)

LOCAL_MODULE := caliper-host
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_SRC_FILES := $(call all-java-files-under, caliper/src/main/java/)
LOCAL_JAVA_RESOURCE_DIRS := caliper/src/main/resources

LOCAL_STATIC_JAVA_LIBRARIES := \
  caliper-gson-host \
  caliper-java-allocation-instrumenter-host \
  guavalib

include $(BUILD_HOST_JAVA_LIBRARY)

# build caliper tests
# ============================================================

include $(CLEAR_VARS)

LOCAL_MODULE := caliper-tests
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_SRC_FILES := $(call all-java-files-under, caliper/src/test/java/)

LOCAL_STATIC_JAVA_LIBRARIES := \
  caliper-host \
  junit

include $(BUILD_HOST_JAVA_LIBRARY)

# Build dependencies.
# ============================================================
include $(CLEAR_VARS)

LOCAL_PREBUILT_JAVA_LIBRARIES := \
    caliper-gson-host:lib/gson-1.7.1$(COMMON_JAVA_PACKAGE_SUFFIX) \
    caliper-java-allocation-instrumenter-host:lib/java-allocation-instrumenter-2.0$(COMMON_JAVA_PACKAGE_SUFFIX)

include $(BUILD_HOST_PREBUILT)
