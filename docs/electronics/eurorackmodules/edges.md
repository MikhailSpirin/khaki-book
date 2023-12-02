---
title: "Mutable Instruments Edges (Clone - Mutated)"
date: 2023-13-11
draft: false
---

### Pre
I really think that with this module i open new story in my eurorack building story. It's 0603 smd, it is XMEGA AVR microcontroller, it is dense and very cool. Here i'll share what was that about.

### Sourcing
Very high-quality PCB and panel were ordered on Pusherman with very little money actually, like <20 USD. Parts are not that available in my country, so it took 2 months more to source all components. I want to highlight switches, which were actually rare for me this time, but i've dound out that i can use other switchjes with slightly diffreent dimensions, just soldered longer legs and gave it proper angles.
Also, XMEGA AVR chip was relatively hard to get, Digikey doesn't have them, but locally i've found several sources of (probably) leftover modules. Anyway, i guess it is in "hard to find" category and situation will definitely get worse.

### Soldering
Nothing special, just takes a lot of time. AVR sioldering was relatively simple, for all such chips it is important to keep straight postiions in both x and y coordinates - this will guarantee easy removal of solder joints.

### Problems
So I resoldered crystal several times, as it actually didn't work. My first eperience with non-working crystals actually, never had such before. On 3rd resoldering I deattached part of a copper pad. Solved by rebuilding that pad with wire.

I had several issues with AVRDude... Unfortunately, my AVR programmer doesn't wan't ro work with avrdude version from mutable developer environment. This was solved by installing newer Avrdude, building hex file in vagrant and flshing it outside in regular terminal. I also checked how to upgrade versions in dev environment and didn't succeed wiuth that... It has very specific Linux core, and versions re pinned in the way whcih i weren't able to find how to change. Oh and i should mention that i also had to get fuses config from mutable dev environment makefile edges/edges.hex fuses. Just executed it outside with newer version - and all works.

Last issue is that to me, the lowest pitch on edges is not low enough and i'm not sure what can be reason for this...
But still module is really cool!
