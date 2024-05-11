---
title: "RGB LED panel with ESP32"
date: 2024-05-09
draft: false
---

### Brief
Rgb picel panel, which is widely used in outdoor and indoor advertising, is controlled via ESP32 board. Resolution is 64 x 32 pixels, no visual flickering. Basically panel show time taken from NTP, weather in specific location, and loads images with backgorund. Some transition effects also applied.


### Pre-story
Once i see [this project](https://www.reddit.com/r/raspberry_pi/comments/hxlk9c/been_working_on_this_led_matrix_display_project/).

With my love for pixels and RGB and generative art i can't pass through this. So i bought a panel on Aliexpress and tries to rubn it with Raspberry Pi - unsuccesfully, beacuse of several things:
  - All such opanels are 5v, and Raspberry Pi can't work with it straightaway, so i had to buy logic levels converter, which added wioring and potentional errors to schematic
  - I used this [library for raspberry](https://github.com/hzeller/rpi-rgb-led-matrix). Though it is well documented and people seems to be fine with that, i didn't manage it to work well...
  - At that point this project was definitely higher than my abilities

### ESP8266 part of the story
I started trying this panel with ESP8266-based NodeMCU, because i had spare ones just laying around. I managed to start panel succesfully with [this library](https://github.com/2dom/PxMatrix). Though it actually worked, any additional improvements or features made flickering way worse, up to non-useable device. I decided to move to ESP32 as its faster and seems to be working fine with decent framerate.
