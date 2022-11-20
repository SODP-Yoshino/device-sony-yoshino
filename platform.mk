# Copyright (C) 2014 The Android Open Source Project
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

# Platform path
PLATFORM_COMMON_PATH := device/sony/yoshino

SOMC_PLATFORM := yoshino
SOMC_KERNEL_VERSION := 4.14

PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := msm8998

PRODUCT_SHIPPING_API_LEVEL := 26

SONY_ROOT := $(PLATFORM_COMMON_PATH)/rootdir

TARGET_PD_SERVICE_ENABLED := true

# Wi-Fi definitions for Qualcomm solution
WIFI_DRIVER_BUILT := qca_cld3
WIFI_DRIVER_DEFAULT := qca_cld3
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
TARGET_USES_ICNSS_QMI := true
WIFI_DRIVER_STATE_CTRL_PARAM := "/sys/kernel/boot_wlan/boot_wlan"
WIFI_DRIVER_STATE_OFF := 0
WIFI_DRIVER_STATE_ON := 1

# BT definitions for Qualcomm solution
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_USE_QTI_BT_STACK := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
WCNSS_FILTER_USES_SIBS := true

# RIL
TARGET_PER_MGR_ENABLED := true

# NFC
NXP_CHIP_FW_TYPE := PN553

# Audio
BOARD_SUPPORTS_SOUND_TRIGGER := true

# CASH
TARGET_USES_CASH_EXTENSION := true

# Display
TARGET_HAS_HDR_DISPLAY := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_SDE := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USES_DRM_PP := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2

# Force building a boot image.
# This needs to be set explicitly since Android R
PRODUCT_BUILD_BOOT_IMAGE := true

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_COMMON_PATH)/overlay

# Device Specific Permissions
PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
     frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Audio
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/audio_tuning_mixer_tasha.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tasha.txt \
    $(SONY_ROOT)/vendor/etc/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml

# Audio - Separation between plain AOSP configuration and extended CodeAurora Audio HAL features
AUDIO_HAL_TYPE := $(if $(filter true,$(TARGET_USES_AOSP_AUDIO_HAL)),aosp,caf)
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/$(AUDIO_HAL_TYPE)_common_primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/common_primary_audio_policy_configuration.xml

# Audio - IO policy containing audio_extn configuration
ifneq ($(TARGET_USES_AOSP_AUDIO_HAL),true)
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf
endif

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(SONY_ROOT)/vendor/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Qualcom WiFi Overlay
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# Qualcom WiFi Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

# NFC Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# Touch IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/idc/clearpad.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/clearpad.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# RQBalance-PowerHAL configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/rqbalance_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rqbalance_config.xml

# Platform specific init
PRODUCT_PACKAGES += \
    tad_legacy.rc \
    init.yoshino \
    init.yoshino.pwr \
    ueventd

# Audio
PRODUCT_PACKAGES += \
    sound_trigger.primary.msm8998 \
    audio.primary.msm8998

# GFX
PRODUCT_PACKAGES += \
    copybit.msm8998 \
    gralloc.msm8998 \
    hwcomposer.msm8998 \
    memtrack.msm8998

# GPS
PRODUCT_PACKAGES += \
    gps.msm8998

# Legacy Sensors
DEVICE_MANIFEST_FILE += $(PLATFORM_COMMON_PATH)/vintf/android.hardware.sensors@1-0.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl:64 \
    android.hardware.sensors@1.0-service

PRODUCT_PACKAGES += \
    sensors_leg.ssc \
    sensors_settings \
    hals.conf

# CAMERA
PRODUCT_PACKAGES += \
    camera.msm8998

# QCOM Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl-qti \
    android.hardware.bluetooth@1.0-service-qti

# Camera Augmented Sensing Helper
PRODUCT_PACKAGES += \
   libpolyreg \
   cashsvr \
   libcashctl

# CAMX Libs
PRODUCT_PACKAGES += \
    libcamera_nn_stub \
    libcamerapostproc \
    libcamerapostproc.bitra \
    libcamxexternalformatutils \
    libcom.qti.chinodeutils \
    com.qti.camx.chiiqutils \
    com.qti.chi.override \
    com.qti.chi.override.bitra \
    com.qti.chiusecaseselector \
    com.qti.feature2.anchorsync \
    com.qti.feature2.demux \
    com.qti.feature2.frameselect \
    com.qti.feature2.fusion \
    com.qti.feature2.generic \
    com.qti.feature2.gs \
    com.qti.feature2.hdr \
    com.qti.feature2.memcpy \
    com.qti.feature2.mfsr \
    com.qti.feature2.qcfa \
    com.qti.feature2.rawhdr \
    com.qti.feature2.rt \
    com.qti.feature2.serializer \
    com.qti.feature2.stub \
    com.qti.feature2.swmf \
    com.qti.feature2.anchorsync.bitra \
    com.qti.feature2.demux.bitra \
    com.qti.feature2.frameselect.bitra \
    com.qti.feature2.fusion.bitra \
    com.qti.feature2.rt.bitra \
    com.qti.feature2.memcpy.bitra \
    com.qti.feature2.mfsr.bitra \
    com.qti.feature2.qcfa.bitra \
    com.qti.feature2.hdr.bitra \
    com.qti.feature2.generic.bitra \
    com.qti.feature2.rawhdr.bitra \
    com.qti.feature2.serializer.bitra \
    com.qti.feature2.stub.bitra \
    com.qti.feature2.swmf.bitra \
    com.qti.feature2.gs.bitra \
    com.qti.node.eisv2 \
    com.qti.node.eisv3 \
    com.qti.node.swregistration \
    com.qti.node.memcpy \
    com.qti.hvx.binning \
    com.qti.hvx.addconstant \
    com.qti.node.dummyrtb \
    com.qti.node.dummysat \
    com.qti.node.fcv \
    com.qti.node.stitch \
    com.qti.node.gpu \
    com.qti.node.remosaic \
    com.qti.node.stich \
    com.qti.node.depth \
    com.qti.settings.sm6350 \
    com.qti.settings.sm8150 \
    com.qti.settings.sm8250 \
    com.qti.settings.sm8350 \
    com.qti.stats.common \
    com.qti.stats.afd \
    com.qti.stats.afwrapper \
    com.qti.stats.awbwrapper \
    com.qti.stats.hafoverride \
    com.qti.tuned.default \
    com.qtistatic.stats.aec \
    com.qtistatic.stats.af \
    com.qtistatic.stats.awb \
    com.qtistatic.stats.pdlib \
    libdepthmapwrapper \
    fdconfigpreview \
    fdconfigpreviewlite \
    fdconfigvideo \
    fdconfigvideolite \
    camera.qcom

# MMCamera Framework
PRODUCT_PACKAGES += \
    libflash_pmic \
    libmmcamera_dbg \
    libmmcamera_chromaflash_lib \
    libmmcamera_dummyalgo \
    libmmcamera_eebinparse \
    libmmcamera_eeprom_util \
    libmmcamera_eztune_module \
    libmmcamera_facedetection_lib \
    libmmcamera_faceproc \
    libmmcamera_faceproc2 \
    libmmcamera_hdr_gb_lib \
    libmmcamera_hvx_add_constant \
    libmmcamera_hvx_grid_sum \
    libmmcamera_hvx_zzHDR.so \
    libmmcamera_imglib \
    libmmcamera_imglib_faceproc_adspstub \
    libmmcamera_imglib_faceproc_adspstub2 \
    libmmcamera_llvd \
    libmmcamera_optizoom_lib \
    libmmcamera_paaf_lib \
    libmmcamera_pdaf \
    libmmcamera_pdafcamif \
    libmmcamera_ppeiscore \
    libmmcamera_ppbase_module \
    libmmcamera_quadracfa \
    libmmcamera_stillmore_lib \
    libmmcamera_sw_tnr \
    libmmcamera_sw2d_lib \
    libmmcamera_thread_services \
    libmmcamera_tintless_algo \
    libmmcamera_tintless_bg_pca_algo \
    libmmcamera_trueportrait_lib \
    libmmcamera_tuning \
    libmmcamera_tuning_lookup

# Camera2 Framework
PRODUCT_PACKAGES += \
    libmmcamera2_c2d_module \
    libmmcamera2_cpp_module \
    libmmcamera2_frame_algorithm \
    libmmcamera2_iface_modules \
    libmmcamera2_imglib_modules \
    libmmcamera2_is \
    libmmcamera2_isp_modules \
    libmmcamera2_mct \
    libmmcamera2_mct_shimlayer \
    libmmcamera2_pp_buf_mgr \
    libmmcamera2_pproc_modules \
    libmmcamera2_q3a_core \
    libmmcamera2_q3a_release \
    libmmcamera2_sensor_modules \
    libmmcamera2_stats_algorithm \
    libmmcamera2_stats_lib \
    libmmcamera2_stats_modules

# Camera ISP
PRODUCT_PACKAGES += \
    libmmcamera_isp_abcc44 \
    libmmcamera_isp_abf40 \
    libmmcamera_isp_abf47 \
    libmmcamera_isp_abf48 \
    libmmcamera_isp_bcc40 \
    libmmcamera_isp_bpc40 \
    libmmcamera_isp_bpc47 \
    libmmcamera_isp_bpc48 \
    libmmcamera_isp_scaler_encoder44 \
    libmmcamera_isp_scaler_encoder46 \
    libmmcamera_isp_hdr46 \
    libmmcamera_isp_hdr48 \
    libmmcamera_isp_linearization40 \
    libmmcamera_isp_gic46 \
    libmmcamera_isp_gic48 \
    libmmcamera_isp_demosaic40 \
    libmmcamera_isp_demosaic47 \
    libmmcamera_isp_demosaic48 \
    libmmcamera_isp_gtm46 \
    libmmcamera_isp_clamp_video40 \
    libmmcamera_isp_aec_bg_stats47 \
    libmmcamera_isp_snr47 \
    libmmcamera_isp_color_correct40 \
    libmmcamera_isp_color_correct46 \
    libmmcamera_isp_color_xform_viewfinder40 \
    libmmcamera_isp_color_xform_viewfinder46 \
    libmmcamera_isp_bf_stats47 \
    libmmcamera_isp_be_stats44 \
    libmmcamera_isp_hdr_be_stats46 \
    libmmcamera_isp_mesh_rolloff40 \
    libmmcamera_isp_mesh_rolloff44 \
    libmmcamera_isp_template \
    libmmcamera_isp_color_xform_encoder40 \
    libmmcamera_isp_color_xform_video46 \
    libmmcamera_isp_color_xform_encoder46 \
    libmmcamera_isp_pdaf48 \
    libmmcamera_isp_hdr_bhist_stats44 \
    libmmcamera_isp_bg_stats44 \
    libmmcamera_isp_bg_stats46 \
    libmmcamera_isp_luma_adaptation40 \
    libmmcamera_isp_ihist_stats44 \
    libmmcamera_isp_ihist_stats46 \
    libmmcamera_isp_rs_stats44 \
    libmmcamera_isp_rs_stats46 \
    libmmcamera_isp_cac47 \
    libmmcamera_isp_chroma_enhan40 \
    libmmcamera_isp_clamp_encoder40 \
    libmmcamera_isp_sce40 \
    libmmcamera_isp_gamma40 \
    libmmcamera_isp_gamma44 \
    libmmcamera_isp_cs_stats44 \
    libmmcamera_isp_cs_stats46 \
    libmmcamera_isp_sub_module \
    libmmcamera_isp_ltm44 \
    libmmcamera_isp_ltm47 \
    libmmcamera_isp_fovcrop_viewfinder40 \
    libmmcamera_isp_fovcrop_viewfinder46 \
    libmmcamera_isp_fovcrop_encoder40 \
    libmmcamera_isp_fovcrop_encoder46 \
    libmmcamera_isp_scaler_video46 \
    libmmcamera_isp_black_level47 \
    libmmcamera_isp_black_level48 \
    libmmcamera_isp_chroma_suppress40 \
    libmmcamera_isp_pedestal_correct46 \
    libmmcamera_isp_fovcrop_video46 \
    libmmcamera_isp_clamp_viewfinder40 \
    libmmcamera_isp_demux40 \
    libmmcamera_isp_demux48 \
    libmmcamera_isp_mce40 \
    libmmcamera_isp_bhist_stats44 \
    libmmcamera_isp_scaler_viewfinder44 \
    libmmcamera_isp_scaler_viewfinder46 \
    libmmcamera_isp_wb40 \
    libchromatix_imx219_common \
    libchromatix_imx219_cpp_liveshot \
    libchromatix_imx219_cpp_preview \
    libchromatix_imx219_cpp_snapshot \
    libchromatix_imx219_cpp_video \
    libchromatix_imx219_postproc \
    libchromatix_imx219_liveshot \
    libchromatix_imx219_preview \
    libchromatix_imx219_snapshot \
    libchromatix_imx219_video \
    libchromatix_imx219_default_preview \
    libchromatix_imx219_default_video \
    libmmcamera_imx219 \
    libactuator_lc898217xc \
    libchromatix_imx258_common \
    libchromatix_imx258_cpp_liveshot \
    libchromatix_imx258_cpp_preview \
    libchromatix_imx258_cpp_snapshot \
    libchromatix_imx258_cpp_video \
    libchromatix_imx258_video \
    libchromatix_imx258_liveshot \
    libchromatix_imx258_postproc \
    libchromatix_imx258_preview \
    libchromatix_imx258_snapshot \
    libchromatix_imx258_default_preview_lc898217 \
    libchromatix_imx258_default_video_lc898217 \
    libmmcamera_imx258\
    libactuator_bu64747BS2 \
    libchromatix_imx400_common \
    libchromatix_imx400_cpp_liveshot \
    libchromatix_imx400_cpp_preview \
    libchromatix_imx400_cpp_snapshot \
    libchromatix_imx400_cpp_video \
    libchromatix_imx400_postproc \
    libchromatix_imx400_liveshot \
    libchromatix_imx400_preview \
    libchromatix_imx400_snapshot \
    libchromatix_imx400_video \
    libchromatix_imx400_default_preview_bu64747 \
    libchromatix_imx400_default_video_bu64747 \
    libmmcamera_imx400


PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Legacy BT property (will be removed in S)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=cherokee

# Fluence
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluence

# aDSP sensors
## max rate
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sensors.max_accel_rate=false \
    ro.qti.sensors.max_gyro_rate=false \
    ro.qti.sensors.max_mag_rate=false \
    ro.qti.sensors.max_geomag_rotv=50

## sensor type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sdk.sensors.gestures=false \
    ro.qti.sensors.pedometer=false \
    ro.qti.sensors.step_detector=true \
    ro.qti.sensors.step_counter=true \
    ro.qti.sensors.pam=false \
    ro.qti.sensors.scrn_ortn=false \
    ro.qti.sensors.smd=true \
    ro.qti.sensors.game_rv=true \
    ro.qti.sensors.georv=true \
    ro.qti.sensors.cmc=false \
    ro.qti.sensors.bte=false \
    ro.qti.sensors.fns=false \
    ro.qti.sensors.qmd=false \
    ro.qti.sensors.amd=false \
    ro.qti.sensors.rmd=false \
    ro.qti.sensors.vmd=false \
    ro.qti.sensors.gtap=false \
    ro.qti.sensors.tap=false \
    ro.qti.sensors.facing=false \
    ro.qti.sensors.tilt=false \
    ro.qti.sensors.tilt_detector=true \
    ro.qti.sensors.dpc=false \
    ro.qti.sensors.qheart=false \
    ro.qti.sensors.wu=true \
    ro.qti.sensors.proximity=true \
    ro.qti.sensors.gravity=true \
    ro.qti.sensors.laccel=true \
    ro.qti.sensors.orientation=true \
    ro.qti.sensors.rotvec=true \
    ro.qti.sensors.fast_amd=false \
    ro.qti.sensors.wrist_tilt=false \
    ro.qti.sensors.pug=false \
    ro.qti.sensors.iod=false \
    ro.qti.sensors.als_scale=1000 \
    ro.qfusion_use_report_period=false

# SurfaceFlinger
# Keep in sync with NUM_FRAMEBUFFER_SURFACE_BUFFERS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=2

# Display HACK: Use GPU composition only
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.primary_mixer_stages=1

# USB controller setup
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.controller=a800000.dwc3 \
    sys.usb.rndis.func.name=gsi

#WiFi MAC address path
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.addr_path=/data/vendor/wifi/wlan_mac.bin

# Audio - QCOM HAL
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.compr_voip.enable=true \
    vendor.audio.offload.buffer.size.kb=32

# IWLAN
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.iwlan_operation_mode=legacy

# setup dm-verity configs.
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/1da4000.ufshc/by-name/system
$(call inherit-product, device/sony/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, build/target/product/verity.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
