---
Title: Algoritms
Author: m
Date: 26082023
---

# Idea behind this article

Purpose of this article is to gather information and links about ideas and approaches to  algorithmic art. I'm going to use this article as a reference, as an idea source, as a inspiration.

## Rainbow Smoke

Very simple idea with stunning results.
All is described here: http://rainbowsmoke.hu/home
Also, i find this youtube really useful: [smoking](https://www.youtube.com/watch?v=dVQDYne8Bkc)

Possible directions

- Change colorspace size/content (e.g. CMYK)
- Use other painting (Rembrandt?) as source for palette
- Use approach to change other params - for example, flow fields to determine direction of next pixel
- Scroll through colorspace (x/y/z) to create animation

## Packing on plain surface

Idea first appeared to me when i thought of generative city in ortho projection, like in this [insta](https://www.instagram.com/idflood/)
I need a way to pack obkects on surface, 2d or 3d. For city 2d s fine, i can play later with height of buildings.

So most wonderful way i found is [this one](https://paulbourke.net/fractals/randomtile/).

This is example of 2d figures filled with this [approach](https://paulbourke.net/fractals/randomtile/statistical_geometry_examples.pdf).

One issue which is essential for this algorithm is how to get intersection. For Blender, i found BHVTree approach is fine but really slow, expectially for 100+ objects.
For python 2d i found great library shapely, which can be used to solve this issue.

## Linear optimization

This story start with this book: https://www.amazon.com/Opt-Art-Mathematical-Optimization-Visual/dp/0691164061
I have it in Hardcover, and though it is hard to get Math behind what happens there, i will try to explain it here:

There is a very common problem of function optimization based on some consttraints. May be the most known is problem of travelling salesman problem, is known to be very hard in any case with relatively many points; at the same time, process called linear optimizaion allows to solve the problem with some predicted precision. We usually don't need absolutely optimal solution, almost optimal is usually fine.

So one of usage of linear optimization can be finding of placement some mozaic tiles with some consttraints. Above book shows some examples: ![here](https://static.scientificamerican.com/blogs/assets/Image/obamabosch.png)

I guess images like [this](https://www.pinterest.com/pin/674906694178916889/) can also be done this way

Things to investigate:

- [pydata linear optimization talk](https://www.youtube.com/watch?v=7yZ5xxdkTb8)

- on [realpython](https://realpython.com/linear-programming-python/)

## Links and other ideas

1. Wow! Tons of articels in [Bridges Archive](https://archive.bridgesmathart.org/#gsc.tab=0)
