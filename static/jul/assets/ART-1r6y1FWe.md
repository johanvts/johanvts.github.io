# Art: wrapping

Early-90s pre-rendered CGI à la Myst with a Christmas theme, generated with
`scripts/gen-art.py` (Gemini Flash unless `--model lite`). The script adds the shared style prompt.

jpg` (the glimpse back into the
workshop, shared by all five task rooms) was generated once with the prompt below.

`present.png` is a copy of the gift machine's. Drawn in code: the squares on the board, the
presents (cardboard stretched to size, the box faces as tinted polygons), the side lengths,
the tags and the ribbon lines.

Clean-up with Pillow: `board.png` came with bits of log wall around the frame and was cropped
to the oak frame (box (50,38,546,387)); the cream inside is x 26–472, y 24–326.
`cardboard.jpg` came with a room behind the board and was cropped to the board (50,30,205,230).
The first `cardboard.jpg` prompt ("seamless texture of corrugated cardboard") was refused by
the API (IMAGE_RECITATION); the first ribbon looked like brass rings; the first background had
the table across the whole width, in front of the door; the second had pale boards, a corner by
the door and a window behind the shelf. The background now uses the workshop's as a reference
so the logs match. Without "absolutely nothing on it" the table came with candles and tools.
The left lantern sat behind the door's sign and was painted out with Pillow (the wall patch
(140,180,260,380) pasted at (10,180) through a soft mask).

```bash
A=src/rooms/wrapping/assets; G="python3 scripts/gen-art.py"

$G $A/paper-red.png --size 170x130 --cutout --screen magenta "A single loosely folded flat sheet of red Christmas wrapping paper with small gold stars, lying flat, seen from the front, slightly curled corner."



$G $A/board.png --size 600x460 --cutout --screen magenta "A large blank cream-coloured drafting board in a simple oak frame, hanging on the wall, seen exactly front-on, the cream surface completely plain and empty, no lines, no paper on it."

$G $A/bg.jpg --size 1280x720 --ref src/rooms/workshop/assets/bg.jpg "A completely flat back wall of a cosy gift-wrapping room seen exactly straight-on, filling the whole image from left edge to right edge, with no side walls, no corners and no windows: the same horizontal honey-brown pine log wall as in the reference image, with the same fir garlands and red ribbons along the very top edge, two wrought-iron oil lanterns on the wall near the far left and far right edges, a worn plank floor strip along the bottom. A long plain oak table seen from the front stands against the wall covering only the right four fifths of the image width, its top edge at about 60 percent of the image height. The table top is completely bare and empty: absolutely nothing on it, no candles, no paper, no tools, no objects. At the far left, the plain log wall and the plank floor are visible next to the table end."

$G $A/cardboard.jpg --size 256x256 "Close-up of a plain sheet of light brown kraft packing board, surface texture only, evenly lit from the front, filling the whole frame, nothing else."

```

## Decorations
Shared Christmas props, generated once and copied into each room that uses them:

```bash
A=src/rooms/wrapping/assets; G="python3 scripts/gen-art.py"
$G $A/tree.png --size 160x300 --cutout --screen magenta "A small Christmas tree in a wooden tub, decorated in old-fashioned Danish style with real white candles (unlit), woven red-and-white paper hearts, little Danish flags garlands, gold paper cones and a gold star on top. Only this one object, seen exactly front-on, fully visible. Nothing else: no wall, no room, no floor, no background objects."
```

## The way back
`arrow.png` (shared by all task rooms) is drawn flipped or turned in code to point the way to the hall.

```bash
A=src/rooms/wrapping/assets; G="python3 scripts/gen-art.py"
$G $A/arrow.png --size 200x120 --cutout --screen magenta "A festive carved wooden arrow sign pointing to the right, painted Christmas red with a gold painted edge, a small sprig of fir with two red berries tied on its tail end with a gold ribbon, blank, no writing. Only this one object, seen exactly front-on, flat, no perspective, fully visible. Nothing else: no wall, no room, no floor, no background objects." > $S/rd/arrow.log 2>&1
```

## Matching the hall
`bg.jpg` is not generated: it is the workshop hall itself (`src/rooms/workshop/assets/bg.jpg`),
cropped to what lies behind the wrapping table there (box (250,110,890,470): the Christmas tree,
the barn doors and the sleigh), scaled to 1280x720, blurred (Gaussian radius 9) and darkened to 92 %.
In front of it, sharp: the easel (behind the board), the rack (behind the rolls) and the table
(`table.png`, 746x300, the back edge of its top at y 20, shown 1200x300). `$REF` below is the crop
(262,380,600,700) of the hall, its wrapping table.

```bash
A=src/rooms/wrapping/assets; G="python3 scripts/gen-art.py"
$G $A/table.png.png --size 1100x300 --cutout --screen magenta --ref $REF "One long sturdy oak wrapping table like the one in the reference image, seen from the front and slightly from above, its long empty top surface clearly visible, thick legs and a low shelf, a few sprigs of fir and a red ribbon curl lying at one end. Only this one object, seen exactly front-on, flat, no perspective, fully visible. Nothing else: no wall, no room, no floor, no background objects."
$G $A/rack.png.png --size 560x480 --cutout --screen magenta "One tall free-standing wooden rack for wrapping paper: two upright oak posts on small feet joined by two horizontal oak cross beams, one near the top and one in the middle, with a fir garland and a red bow on the top beam, empty, nothing hanging on it. Only this one object, seen exactly front-on, flat, no perspective, fully visible. Nothing else: no wall, no room, no floor, no background objects."
$G $A/easel.png.png --size 520x560 --cutout --screen magenta "One sturdy wooden tabletop easel of oak, seen from the front, its two front legs and a ledge, with a sprig of fir and a red bow at the top, empty, nothing on it. Only this one object, seen exactly front-on, flat, no perspective, fully visible. Nothing else: no wall, no room, no floor, no background objects."
```
