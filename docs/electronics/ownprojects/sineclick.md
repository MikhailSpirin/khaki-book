---
title: "Sine Click Musical Box"
date: 2023-11-01
draft: false
---

### Pre
I want to build sonic box, which can be useable on its own and be a sound source for my eurorack box. This will be based on Mozzy library + some ESP8266 NodeMCU boards, which i have; spent some time on thinking about what it will sound, and i guess i will use this video as base:

https://www.youtube.com/watch?v=CLddxGIlVPU

### Prototype
I have a spare ready-to-go box whiuch i built for previous project, i

### Main Idea
I'm going to have Metro object counting 32th, and start/stop samples based on tick property of this metro object.

### Links

Very intersting Arduino-eurorack and other stuff site:
http://pjmnc.free.fr/
Very important stuff for me, adding trig in/ trig out to arduino with this schematics: http://pjmnc.free.fr/files/arduino_io.bmp

Buttons with ESP8266
https://diyi0t.com/switches-tutorial-for-arduino-and-esp8266/

As mozzi output, i'm using this circuit which seems to work very well on all boardss which i Heave:
https://ensorium.github.io/Mozzi/learn/output/

I will start witgh this mixer:
https://www.youtube.com/watch?v=q8tmUgaXrEQ

ESP8266 reference gpios:
https://randomnerdtutorials.com/esp8266-pinout-reference-gpios/

Analog IN for ESP8266:
https://www.electronicshub.org/nodemcu-esp8266-adc-tutorial/

Mozzi board-specific things are described here - https://github.com/sensorium/Mozzi
