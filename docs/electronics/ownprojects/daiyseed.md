Ok, this part will be about my play with Daisy Seed Arduino-style music-dsp-creating wonderful-and-complicated Daisy Seed.

I bought several differen Daisy products. This exact https://electro-smith.com/products/daisy-seed was convemned to be my Daisy playground - for trying DSP platform. Pod product is a bit pricey for additional 2 pots and 4 jacks, so i decided to build my own; better, and, what is most important, mine.

First iteration was good enough but there were several downsides there:

1. I didn't manage to put there more than 2 pots;
2. Spend some time trying to figure out how to do headphones level... and finished buying additional board specifically for that purpose, also with separate audio volume control;
3. Absend MIDI in first iteration


# Pinout and connections

1 GPIO0               DGND
2 GPIO1               VIN
3 GPIO2               3v3 D
4 GPIO3               GPIO30
5 GPIO4               GPIO29
6 GPIO5               GPIO28
7 GPIO6               GPIO27
8 GPIO7               GPIO26
9 GPIO8               GPIO25
10 GPIO9              GPIO24 - btn4
11 GPIO10             GPIO23 - btn3
12 GPIO11             GPIO22 - btn2
13 GPIO12             GPIO21 - btn1
14 GPIO13 -           GPIO20 - pot6
15 GPIO14 -           GPIO19 - pot5
16 A_IN_L             GPIO18 - pot4
17 A_IN_R             GPIO17 - pot3
18 A_OUT_L            GPIO16 - pot2
19 A_OUT_R            GPIO15 - pot1
20 AGND               3v3 A

# Layout of controls

                ┌──────┐ ┌──────┐
                │ led1 │ │ led2 │
                └──────┘ └──────┘
┌─────────────┐ ┌──────┐ ┌──────┐
│             │ │ pot5 │ │ pot6 │
│  DaisySeed  │ └──────┘ └──────┘
│             │ ┌──────┐ ┌──────┐
│             │ │ pot3 │ │ pot4 │
│             │ └──────┘ └──────┘
│             │ ┌──────┐ ┌──────┐
│             │ │ pot1 │ │ pot2 │
│             │ └──────┘ └──────┘
│             │ ┌──────┐ ┌──────┐
│             │ │ btn3 │ │ btn4 │
└─────────────┘ └──────┘ └──────┘
┌─────┐ ┌─────┐ ┌──────┐ ┌──────┐
│     │ │     │ │ btn1 │ │ btn2 │
└─────┘ └─────┘ └──────┘ └──────┘



{
	"name": "seed",
	"som": "seed",
	"components": {
		"sw1": {
			"component": "Switch",
			"pin": 17
		},
		"sw2": {
			"component": "Switch",
			"pin": 18
		},
		"sw3": {
			"component": "Switch",
			"pin": 19
		},
		"sw4": {
			"component": "Switch",
			"pin": 20
		},
		"knob1": {
			"component": "AnalogControl",
			"pin": 16
		},
		"knob2": {
			"component": "AnalogControl",
			"pin": 15
		},
		"led1": {
			"component": "Led",
			"pin": 14
		},
		"led2": {
			"component": "Led",
			"pin": 13
		}
	}
}
