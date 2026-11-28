# Art: giftmachine

Early-90s pre-rendered CGI à la Myst with a Christmas theme, generated with
`scripts/gen-art.py` (Gemini Flash unless `--model lite`). The script adds the shared style prompt.

png` are copies of the workshop's, `window.png` of `examples/gears/`.
`peek-workshop.jpg` is shared by all task rooms. Drawn in code: the sums, the ticks and numbers
on the rails, the moving seams on the belt, the steam and smoke.

Measured in `room.ts`: `belt.png` (570x130) has its top surface at y 12 and is shown 868 wide
so its legs reach the floor; the machines are scaled to 300 px high and hang from `STATION.top`.

Clean-up with Pillow: `box.png` and `box-ribbon.png` came on a grey studio background (the
reference image's) and were flood-filled from the corners and cut out; `box-ribbon.png` also lost
its grey shadow. Both then had a light fringe: the alpha was eroded 2 px and light grey pixels within
4 px of the edge removed. All boxes were trimmed; the code scales every stage to the same width.
`basket.png` is drawn twice: whole behind the present, and cropped below its front rim (y 66) in front.

```bash
A=src/rooms/giftmachine/assets; G="python3 scripts/gen-art.py"
$G $A/bg.jpg --size 1280x720 "A completely flat back wall of a workshop room seen exactly straight-on, filling the whole image from left edge to right edge with no side walls and no corners: dark timber planks with copper pipes running along the very top edge, a few hanging brass tools, warm candlelight, a worn plank floor strip along the bottom eighth of the image. The rest of the wall is completely empty: no machines, no doors, no furniture."
$G $A/lever.png --size 70x240 --cutout --screen magenta "One long straight brass lever arm standing exactly vertical, with a round red-painted wooden knob on top and a round brass pivot hub at the bottom, seen exactly front-on, nothing else."
$G $A/basket.png --size 240x130 --cutout --screen magenta "An empty wide woven wicker basket lined with straw, seen exactly front-on at eye level, standing on the floor."
$G $A/present.png --size 150x150 --cutout --screen magenta "A single Christmas present: a box wrapped in shiny red paper with a gold ribbon and a big gold bow on top, seen front-on, slightly from above."
$G $A/coal.png --size 110x80 --cutout --screen magenta --model lite "A single black lump of coal, matte and rough, seen front-on."

$G $A/station-paper.png --size 220x320 --cutout --screen magenta "A compact Christmas workshop machine head of red-painted wood and riveted brass, hanging from a short cast-iron bracket at the top, a big roll of red wrapping paper mounted on top of it, small cogs and a pressure gauge without numbers on its front, and a wide brass nozzle pointing straight down at the bottom. Seen exactly front-on, flat, no perspective. The whole machine is fully visible, not cropped."
$G $A/station-ribbon.png --size 220x320 --cutout --screen magenta "A compact Christmas workshop machine head of red-painted wood and riveted brass, hanging from a short cast-iron bracket at the top, a big spool of shiny gold ribbon mounted on top of it, small cogs and a pressure gauge without numbers on its front, and a wide brass nozzle pointing straight down at the bottom. Seen exactly front-on, flat, no perspective. The whole machine is fully visible, not cropped."
$G $A/station-bow.png --size 220x320 --cutout --screen magenta "A compact Christmas workshop machine head of red-painted wood and riveted brass, hanging from a short cast-iron bracket at the top, a little open hopper full of gold gift bows on top of it, small cogs and a pressure gauge without numbers on its front, and a wide brass nozzle pointing straight down at the bottom. Seen exactly front-on, flat, no perspective. The whole machine is fully visible, not cropped."
$G $A/belt.png --size 900x130 --cutout --screen magenta "A long low conveyor belt seen exactly from the side, flat side elevation: a sturdy oak frame on short wrought-iron legs, a big brass roller at each end, a flat dark leather belt running along the top, empty, nothing on it. Seen exactly front-on, flat, no perspective. The whole machine is fully visible, not cropped."
$G $A/rod-track.png --size 50x380 --cutout --screen magenta "One tall straight vertical brass rail with a long narrow slot down its middle, a small bracket with two screws at the top and at the bottom, plain, no markings. Seen exactly front-on, flat, no perspective. The whole machine is fully visible, not cropped."
$G $A/rod-handle.png --size 110x60 --cutout --screen magenta "One short horizontal brass pull bar with a round red-painted wooden grip at each end, like the handle of a pull rod, nothing else. Seen exactly front-on, flat, no perspective. The whole machine is fully visible, not cropped."
$G $A/slate.png --size 260x130 --cutout --screen magenta "A small blank landscape slate chalkboard in a simple oak frame, the slate dark and completely empty, faint smudges. Seen exactly front-on, flat, no perspective. The whole machine is fully visible, not cropped."
$G $A/box.png --size 120x120 --cutout --screen magenta --ref $A/present.png "The same box as in the reference image, same size, shape and angle, but plain brown cardboard, unwrapped, no paper, no ribbon, no bow."
$G $A/box-paper.png --size 120x120 --cutout --screen magenta --ref $A/present.png "The same box as in the reference image, same size, shape and angle, wrapped in the same shiny red paper, but with no ribbon and no bow."
$G $A/box-ribbon.png --size 120x120 --cutout --screen magenta --ref $A/present.png "The same box as in the reference image, same size, shape and angle, wrapped in the same shiny red paper with the same gold ribbon crossing it, but with no bow on top."
```


## The way back
`arrow.png` (shared by all task rooms) is drawn flipped or turned in code to point the way to the hall.

```bash
A=src/rooms/giftmachine/assets; G="python3 scripts/gen-art.py"
$G $A/arrow.png --size 200x120 --cutout --screen magenta "A festive carved wooden arrow sign pointing to the right, painted Christmas red with a gold painted edge, a small sprig of fir with two red berries tied on its tail end with a gold ribbon, blank, no writing. Only this one object, seen exactly front-on, flat, no perspective, fully visible. Nothing else: no wall, no room, no floor, no background objects." > $S/rd/arrow.log 2>&1
```

## The three toys: interim, to be generated
The train, the teddy bear and the doll are drawn in code (`drawToy` in `room.ts`) because the Gemini
credit ran out (HTTP 402). Generate these when it is back; `drawToy` uses `toy-<id>` automatically once
it is in the `ART` table (add `'toy-train': 'png', 'toy-bear': 'png', 'toy-doll': 'png'`).

```bash
A=src/rooms/giftmachine/assets; G="python3 scripts/gen-art.py"
$G $A/toy-train.png --size 160x110 --cutout --screen magenta "A small old-fashioned wooden toy steam train engine painted red and green with gold trim and black wheels, a little chimney, seen from the side. Only this one object, seen from the front and slightly from above, fully visible. Nothing else: no wall, no room, no table, no floor, no background objects."
$G $A/toy-bear.png --size 110x140 --cutout --screen magenta "A small cuddly brown teddy bear sitting upright, with a red ribbon bow at its neck, button eyes. Only this one object, seen from the front and slightly from above, fully visible. Nothing else: no wall, no room, no table, no floor, no background objects."
$G $A/toy-doll.png --size 90x150 --cutout --screen magenta "A small old-fashioned wooden peg doll in a red dress with a white apron and yellow braids, standing upright. Only this one object, seen from the front and slightly from above, fully visible. Nothing else: no wall, no room, no table, no floor, no background objects."
```

`note.png` (the wish list) is a copy of the stable's.
