# Notes to self

## How to make the test print

- use ergogen to output `build/outlines/test_print.dxf`
- In freecad, start a new file and use Draft workbench
- Import the .dxf file. It will create many shapes.
- Select them all and hit the blue up arrow to upgrade them to wires
- Select them all and click the squiggly icon to convert to sketch
- Switch to Part Design Workbench
- Make a new body
- put the sketch in the body
- select the sketch and pad up 6mm

# MCU pinout on RP2040 (compatible)

| Pin | Use   | (center) | Use        | Pin |
| --- | ----- | -------- | ---------- | --- |
|     |       |          | Col Thumb  | P19 |
|     |       |          | col inner  | P18 |
| P6  | row 4 |          | col index  | P15 |
| P7  | row 3 |          | col middle | P15 |
| P8  | row 2 |          | col ring   | P16 |
| P9  | row 1 |          | col pinky  | P10 |

# v1 Solder Jumpers

TL;DR this is very confusing because reversible/symmetric PCBs are confusing.

With your PCBs laid out left & right as they will be when the keyboard is built and in use - top side facing up, you solder **ALL 4 COLUMNS OF JUMPERS ON THE PCB TOP SIDES**. None of the jumpers on the bottom side of the PCBs get soldered.

The left and right PCBs are symmetric, but the left and right MCUs are NOT. So to account for that we have do factor that into our pinouts and jumper routing.

Info for reference:

- In kipra v1, the footprint used was: [nice_nano.js from commit 753a](https://github.com/ceoloide/ergogen-footprints/blob/753a3464b552da21bd121a076ddfa4b47fadcfe8/nice_nano.js) in github.com/ceoloide/ergogen-footprints.
- This version did not yet support the `reverse_mount` parameter. If kipra v2 becomes a thing, we'll do that.
- However, the nice_nano footprint is design with the following configuration in mind (which we do NOT want to use in the kipra):
  - you want to mount your MCUs face down (Dunno, many folks like this?)
  - you want the jumper solders on the back so they are out of sight and don't obscure the silkscreen for the MCU pinout labels
- BUT in the case of the kipra v1, I specifically want to mount my MCUs face up because they have on-board reset buttons so flashing them is easy and I don't need a reset button on the main keyboard PCB. I added support for one just in case anyway, but hope to not have to use it. In general, I want to support the trend of the hobbyist MCUs having conveniences built-in so the barrier to build a custom keyboard is lower, and every little bit helps.
