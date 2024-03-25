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

