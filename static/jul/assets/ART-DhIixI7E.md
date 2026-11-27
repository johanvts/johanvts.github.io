# Art: sleigh

Early-90s pre-rendered CGI à la Myst with a Christmas theme, generated with
`scripts/gen-art.py` (Gemini Flash unless `--model lite`). The script adds the shared style prompt.

jpg` (the glimpse back into the
workshop, shared by all five task rooms) was generated once with the prompt below.

Drawn in code: the chalk tags, the weight tags on the
parcels, the tilt and the flight. The first `reindeer.png` came with a whole room behind it;
ask for "only the two animals: no room, no wall, no floor".

```bash
A=src/rooms/sleigh/assets; G="python3 scripts/gen-art.py"

$G $A/bg.jpg --size 1280x720 "A completely flat back wall of a big timber sleigh shed seen exactly straight-on, filling the whole image from left edge to right edge with no side walls and no corners: dark log wall with harness and coils of rope near the top on the left; in the right third of the wall a pair of huge barn doors stand wide open, showing deep snow and a blue dusk sky with the first stars; hay on a plank floor strip along the bottom sixth of the image. No sleigh, no animals, no people."

$G $A/sleigh.png --size 620x330 --cutout --screen magenta "A big empty red wooden Christmas sleigh seen exactly from the side, flat side elevation, no perspective: curled gold-trimmed runners, a driver's bench at the far right front, and behind it a long flat empty cargo bed with low sides, nothing on it."

$G $A/parcel-red.png --size 120x110 --cutout --screen magenta "A single Christmas parcel wrapped in red paper with a white string bow, seen exactly front-on."

$G $A/parcel-blue.png --size 120x110 --cutout --screen magenta "A single Christmas parcel wrapped in deep blue paper with silver stars and a gold string bow, seen exactly front-on."

$G $A/parcel-brown.png --size 120x110 --cutout --screen magenta "A single Christmas parcel wrapped in brown paper tied with red-and-white string, seen exactly front-on."

$G $A/reindeer.png --size 300x260 --cutout --screen magenta --people "Two reindeer with big antlers and red leather harnesses with little brass bells, standing side by side on nothing, seen exactly from the side facing right. Only the two animals: no room, no wall, no floor, no background objects."
```

## Decorations
Shared Christmas props, generated once and copied into each room that uses them (the garland came out 363 px wide and is repeated across the top):

```bash
A=src/rooms/sleigh/assets; G="python3 scripts/gen-art.py"
$G $A/wreath.png --size 140x140 --cutout --screen magenta "One round Christmas wreath of fir with a big red bow, red berries, pine cones and gold baubles. Only this one object, seen exactly front-on, fully visible. Nothing else: no wall, no room, no floor, no background objects."
$G $A/garland.png --size 1280x110 --cutout --screen magenta "One long horizontal Christmas garland of thick fir branches hanging in three gentle swags, decorated with red bows, shiny red and gold glass baubles, small woven paper hearts and pine cones. Only this one object, seen exactly front-on, fully visible. Nothing else: no wall, no room, no floor, no background objects."
```

## The way back
`arrow.png` (shared by all task rooms) is drawn flipped or turned in code to point the way to the hall.

```bash
A=src/rooms/sleigh/assets; G="python3 scripts/gen-art.py"
$G $A/arrow.png --size 200x120 --cutout --screen magenta "A festive carved wooden arrow sign pointing to the right, painted Christmas red with a gold painted edge, a small sprig of fir with two red berries tied on its tail end with a gold ribbon, blank, no writing. Only this one object, seen exactly front-on, flat, no perspective, fully visible. Nothing else: no wall, no room, no floor, no background objects." > $S/rd/arrow.log 2>&1
```

## Redraw to match the hall
`bg.jpg` were redrawn with the workshop hall as the first reference and `$REF`, a crop
(490,170,800,520) of `src/rooms/workshop/assets/bg.jpg` (this room's area of the hall), as the second.
Of two background candidates the one with a flat wall and the clearest free space was kept.
This replaces the earlier background prompt above.

```bash
A=src/rooms/sleigh/assets; G="python3 scripts/gen-art.py"
$G $A/bg.jpg --size 1280x720 --ref src/rooms/workshop/assets/bg.jpg --ref $REF "A completely flat back wall of the sleigh shed of Santa's workshop, seen exactly straight-on, filling the whole image from left edge to right edge with no side walls and no corners, warm bright festive candlelight, the same honey-coloured log walls, fir garlands with red bows and baubles, woven paper hearts and cheerful style as the first reference image (Santa's workshop hall), like the barn doors of the second reference image: in the right third of the wall a pair of huge wooden barn doors stand wide open, showing deep snow, fir trees, a cosy village and a blue dusk sky with the first stars; the rest of the log wall is hung with fir garlands, red bows and a few candles; straw on a plank floor strip along the bottom sixth. No sleigh, no animals, no people." > $S/rd/l$v.log 2>&1

```
