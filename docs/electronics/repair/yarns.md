---
title: "Mutable Instruments Clouds Clone - Repair"
date: 2023-17-11
draft: false
---

### Pre

Bought this module on reverb as non-functioning (like "leds don't work"). As Clouds MI module is well documented, there is a schematic and all eagle files, open-source firmware i decided to give it a try and fix. Also price was pretty much decent, so:

### Problem and thinking

Actually when module came i understood that there is more than just leds. Actually i first traced all connections from leds to MCU, seems to be working fine... But actually i understood that module stops working when leds die or - didn't work fin at all (i mean actual desired effect). Inspection showed that module seems to be factory-manufactored - according to quality of soldering and placing of components.
Seems to me it was kind of PCBWay with soldering components. So I thought that will not be productive to search for bad solder joints, it is probably some faulty component. And at that point I had an idea about crystal - as module dies sponaneously, but have all proper power and ground - it is either Reset line, or crystal, or powering problems.

### Solution

So i desoldered smd crystal and soldered new one... Unfortunately i lifted one pad and detouched it from the base, but fixed it with separate wire.

And yes! That was the issue! Module started and worked pretty well after that fix. Simple Clouds, but I didn't have one yet (at least during my consious eurorack period) so it is actualy very interesting to investigate and even change firmware may be.
