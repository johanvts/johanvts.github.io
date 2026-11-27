# Art: stable

Early-90s pre-rendered CGI à la Myst with a Christmas theme, generated with
`scripts/gen-art.py` (Gemini Flash unless `--model lite`). The script adds the shared style prompt.

jpg` (the glimpse back into the
workshop, shared by all five task rooms) was generated once with the prompt below.

`board.png` (the slate) is a copy of the gift machine's. Drawn in code: the names, the
numbers, − / +, the oats in the troughs and the flying scoops.

```bash
A=src/rooms/stable/assets; G="python3 scripts/gen-art.py"

$G $A/bg.jpg --size 1280x720 "A completely flat back wall of a warm reindeer stable seen exactly straight-on, filling the whole image from left edge to right edge with no side walls and no corners: rough honey-coloured timber planks with one horizontal beam high up, a narrow fir garland with small red bows along the very top edge, warm soft light from the left, straw scattered on a plank floor strip along the bottom sixth of the image. The wall is otherwise completely plain and empty: no lanterns, no lamps, no bells, no harnesses, no stalls, no animals, no doors, no windows, no furniture."

$G $A/stall.png --size 160x300 --cutout --screen magenta --people "One narrow wooden reindeer stall seen exactly front-on: two posts, a low half door of planks, and a friendly reindeer with big antlers looking out over the half door straight at the viewer, a small blank wooden name board on top of the stall. Only this one stall."

$G $A/trough.png --size 140x70 --cutout --screen magenta "One small empty wooden feed trough on short legs, seen exactly front-on at eye level."

$G $A/sack.png --size 160x200 --cutout --screen magenta "A big open burlap sack full of oats, the top rolled down, seen exactly front-on, standing on the floor."

$G $A/bucket.png --size 100x100 --cutout --screen magenta "One small empty wooden bucket with iron hoops and a rope handle, seen exactly front-on."

$G $A/bell.png --size 90x130 --cutout --screen magenta "One brass hand bell hanging from a small wrought-iron wall bracket with a short red rope, seen exactly front-on."

$G $A/note.png --size 220x280 --cutout --screen magenta "Only one object: a single sheet of aged cream parchment paper with one small iron nail at the top centre, seen exactly front-on, slightly curled lower corners, completely blank, no writing. Nothing else at all: no room, no wall, no furniture, no fireplace, no frame, no background objects."
```

The first `note.png` (without "only one object … nothing else at all") came with a whole room behind it.
The first background had big bells, harnesses and lanterns that dwarfed the stalls; ask for a plain
wall. The stalls are drawn overlapping by a fifth (neighbours share a post) so they can be big.


## The way back
`arrow.png` (shared by all task rooms) is drawn flipped or turned in code to point the way to the hall.

```bash
A=src/rooms/stable/assets; G="python3 scripts/gen-art.py"
$G $A/arrow.png --size 200x120 --cutout --screen magenta "A festive carved wooden arrow sign pointing to the right, painted Christmas red with a gold painted edge, a small sprig of fir with two red berries tied on its tail end with a gold ribbon, blank, no writing. Only this one object, seen exactly front-on, flat, no perspective, fully visible. Nothing else: no wall, no room, no floor, no background objects." > $S/rd/arrow.log 2>&1
```

## Redraw to match the hall
`bg.jpg` and `stall.png` were redrawn with the workshop hall as the first reference and `$REF`, a crop
(800,200,1110,640) of `src/rooms/workshop/assets/bg.jpg` (this room's area of the hall), as the second.
Of two background candidates the one with a flat wall and the windows at deer height was kept:
the windows (y 200–440) show through the open top of the stalls, as in the hall.
This replaces the earlier background prompt above.

```bash
A=src/rooms/stable/assets; G="python3 scripts/gen-art.py"
$G $A/bg.jpg --size 1280x720 --ref src/rooms/workshop/assets/bg.jpg --ref $REF "The back wall of the reindeer stable corner of Santa's workshop, exactly like the stable in the second reference image and in the right part of the first: honey-coloured log wall, seen exactly straight-on, filling the whole image from left edge to right edge with no side walls and no corners, warm candlelight. In the right three quarters of the wall, at middle height, a row of three small-paned windows with snow on the sills showing a snowy blue winter night outside, evenly spaced. A fir garland with red bows along the very top edge. The lower part of the wall is plain logs; straw on a plank floor strip along the bottom sixth. No stalls, no animals, no furniture, no lanterns, no people."
$G $A/stall.png --size 160x300 --cutout --screen magenta --people --ref $REF "One narrow red-painted wooden reindeer stall like those in the reference image, seen exactly front-on: two posts with a sprig of fir and a small red bow on each, a low red half door of planks with iron hinges, and a friendly reindeer with big antlers looking out over the half door straight at the viewer, a small blank wooden name board on top. Only this one stall, nothing else." > $S/rd/stall.log 2>&1
```
