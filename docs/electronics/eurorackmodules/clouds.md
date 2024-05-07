---
title: "Mutable Instruments Clouds Clone - Repair"
date: 2023-17-11
draft: false
---
### Pre
I purchased this module on Reverb, described as non-functioning, with an issue such as "LEDs don't work." Given the comprehensive documentation of the Clouds MI module, including a schematic, all Eagle files, and open-source firmware, I decided to take a chance and attempt to fix it. Additionally, the price was quite reasonable, so:

### Problem and Considerations
Upon receiving the module, I realized that the issue extended beyond just the LEDs. Initially, I traced all connections from the LEDs to the MCU and found them to be working fine. However, I soon realized that the module ceased to function when the LEDs failed or didn't work as intended. Upon inspection, it became evident that the module was factory-manufactured, judging by the quality of soldering and component placement. It appeared to be a product of PCBWay or similar company. I concluded that searching for faulty solder joints might not be productive as it is factory, so I started thinking on searching for a defective component. At some point, I entertained the idea that the problem could be related to the crystal. Since the module spontaneously died, the issue could be with the reset line, crystal, or power supply.

### Solution
I proceeded to desolder the SMD crystal and replaced it with a new one. Unfortunately, I accidentally lifted one pad and detached it from the base, but I managed to fix it using a separate wire.

### And indeed, that was the issue!

The module started working and performed well after this fix. Although it's a Simple Clouds, I hadn't owned one before (at least during my conscious Eurorack period), making it particularly interesting to investigate, and I might even consider changing the firmware.

### And no, ot is not working...

Weird symptoms: when putting too much reverb, module dies. I gave up and ordered new codec and MCU, i hope to solve the issue by resoldering both of them. Also i like to resolder it - this is so cool!
