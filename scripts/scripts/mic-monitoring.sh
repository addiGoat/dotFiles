#!/usr/bin/env sh

pw-loopback \
    --capture=alsa_input.usb-Razer_Inc_Razer_Seiren_Mini_UC2132L03300112-00.mono-fallback \
    --playback=alsa_output.usb-Focusrite_Scarlett_Solo_USB_Y71KMGP1BD8034-00.HiFi__Line__sink \
    --latency=5
