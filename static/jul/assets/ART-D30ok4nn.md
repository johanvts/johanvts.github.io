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

## Redraw to match the hall
`bg.jpg` were redrawn with the workshop hall as the first reference and `$REF`, a crop
(262,380,600,700) of `src/rooms/workshop/assets/bg.jpg` (this room's area of the hall), as the second.
Of two background candidates the one with a flat wall and the clearest free space was kept.
This replaces the earlier background prompt above.

```bash
A=src/rooms/wrapping/assets; G="python3 scripts/gen-art.py"
$G $A/bg.jpg --size 1280x720 --ref src/rooms/workshop/assets/bg.jpg --ref $REF "A completely flat back wall of the gift-wrapping corner of Santa's workshop, seen exactly straight-on, filling the whole image from left edge to right edge with no side walls and no corners, warm bright festive candlelight, the same honey-coloured log walls, fir garlands with red bows and baubles, woven paper hearts and cheerful style as the first reference image (Santa's workshop hall), and like the wrapping table of the second reference image. At the far left a candle-lit Christmas tree with woven paper hearts stands in front of the wall, filling the leftmost fifth of the image. A long plain oak table seen from the front runs from about a quarter of the width to the right edge, its bare empty top edge at about 63 percent of the image height. The log wall above the table, in the middle and right of the image, is plain and empty for things to be hung on it. No wrapping paper, no presents, no rolls, no shelves, no windows, no people." > $S/rd/w$v.log 2>&1

```
