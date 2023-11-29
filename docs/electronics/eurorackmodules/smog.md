---
title: "Antumbra Smog (Clouds clone)"
date: 2023-11-20
draft: false
---

With this module i'm going to break story of my unsuccessful common story with Clouds modules. First one, Typhoon, i actually burned in the most stupid way - messed power header. Also i bought non-working clouds... And problem which seemed to be simple became large problem. Ok, i even burnt MCU on this module! But lets start from the beginning

I really like Antumbra, it has cool design, it is really hp-friendly, it has great pcb design. Sourcing parts were not an issue here, everything was actually accessible. Only MCU made some problem - chip shortage made very different and alogical prices and availablility for it. Anyway, all parts are sourced and soldered. Turning on! Even flashing via JTAG socket was simple. I used STlink from Discovery board, everythong worked perfectly fine, i did use Mutable Dev Environment, which is very useful.

Problem number one - module seemed to flash fine, but leds almost doesn't react on button presses. While reflashing and mingling arounf with those, something happend and it stopped to react on buttons completely. And, MCU started to heat fast. Ok, let's check...

So i see that voltge regulator LM1117 actulay lost leg which was soldered to the ground. I don't now what it decided, but it actually put 6V on 3.3V line!
I think MCU is dead, also probably WM8731 also didn't survive; its power is tolerant to 3.6V max according to datasheet. So I resoldered both ICs.

Now it works well, but i see that LEDS still doesn't shine.. I decided to check LED resistors and yes, for some reason (i can think only about messing rows in my BOM spreadsheet) i soldered 200k instead of 68 Ohm. Resoldering and everythin works perfectly

Finally! My Clouds is done.
