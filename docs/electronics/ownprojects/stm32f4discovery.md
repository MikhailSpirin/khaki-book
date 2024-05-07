---
title: "DSP on stm32f4discovery"
date: 2024-01-02
draft: false
---

# Intention

I have a STM32F4 discovery board, which i use as st-link programmator and for learning stm32 ecosystem.
Basicaly this board has already audio out and a microphone, which i can use; also, there is a number of dsp github projects for this board, so i decided to learn it to be able to do some dsp. This page contains my findoings and sources of wisdom.

# My "Shield" for stm32f4

For easier params mangling, i decided to solder additional board with pots and buttons - here is it's schematic

┌────────┐        ┌─────────┐
│PA1 in1 │        │ PA2 in2 │
└────────┘  ┌───┐ └─────────┘
            │PE2│
┌────────┐  ├───┤ ┌─────────┐
│PA3 in3 │  │PE4│ │ PB0 in8 │
└────────┘  └───┘ └─────────┘

┌────────┐  ┌───┐ ┌────────┐
│PB1 in9 │  │PE5│ │PC1 in11│
└────────┘  ├───┤ └────────┘
            │PE6│
┌────────┐  └───┘ ┌────────┐
│PC4 in14│        │PC5 in15│
└────────┘        └────────┘
┌────────┐  ┌────┐ ┌────────┐
│  PB4   │  │PB5 │ │  PB7   │
└────────┘  └────┘ └────────┘

Connecting buttons and pots is preatty easy: buttons and toggles - connect to gnd and signal pin, potentiomeneter - 3.3 signal_pin gnd. Notice that some legs on disco board are already used by periphirals, so check such with CubeMX soft for discovery board.
Nine ADC channels are still free, though they are not 1-8, there are some occupied channels.

# Links

https://github.com/umer06/Audio-DSP

https://github.com/har-in-air/STM32_CODE_EXAMPLES

https://github.com/rogerallen/stm32disc_synth1/tree/main

https://www.youtube.com/watch?v=lNBrGOk0XzE&t=416s

# General Heap about my DSP learnings

https://trebledj.me/posts/digital-audio-synthesis-for-dummies-part-1/

Some community-supported open-source dsp algorithms
https://www.musicdsp.org/en/latest/

Some DSP on clouds
https://medium.com/music-thing-modular-notes/how-to-get-started-writing-your-own-firmware-for-mutable-instruments-clouds-a08173cec317

wiki on STM32F4
https://stm32world.com/wiki/Main_Page

some lessons specifically about STM32F Discovery board
https://embeddedsystemengineering.blogspot.com/search/label/STM32F4%20Discovery
