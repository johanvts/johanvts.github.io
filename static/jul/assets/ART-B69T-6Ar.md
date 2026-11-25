# Art: workshop

Early-90s pre-rendered CGI à la Myst with a Christmas theme, generated with
`scripts/gen-art.py` (Gemini Flash; `flame.png` with `--model lite`). The script adds
the shared style prompt.

Drawn in code, not in the images: the room names on the brass signs, the drop
shadows, the candle glow and flicker, the warm wash per lit candle.
If you regenerate `doorframe.png`, `barnframe.png` or `candlestick.png`, re-measure
the openings / wick tips and update `DOOR`, `BARN` and `WICKS` in `room.ts`.

```bash
A=src/rooms/workshop/assets; G="python3 scripts/gen-art.py"
P="A tall narrow view straight through an open doorway into the next room, seen from the threshold, filling the entire image edge to edge, no door frame, no door, warmly lit so it glows invitingly:"

$G $A/bg.jpg --size 1280x720 "A completely flat back wall of Santa's great workshop hall seen exactly straight-on, filling the whole image from left edge to right edge with no side walls and no corners: horizontal timber log wall of warm honey-brown pine, thick fir garlands with red ribbons and small pine cones hanging in swags along the very top edge, two wrought-iron oil lanterns on the wall near the far left and far right edges casting warm pools of light, a worn wide-plank wooden floor strip along the bottom eighth of the image. Below the garlands the wall is completely empty: no doors, no windows, no shelves, no furniture, no machines."

$G $A/doorframe.png --size 220x420 --cutout --screen magenta "A tall rectangular doorway surround of carved red-painted wood with a little folk-art carving of hearts and stars on the lintel, a small sprig of fir with a red bow on top, two straight jambs, seen exactly front-on, flat, no perspective. The door opening inside the surround is filled with flat pure magenta (#FF00FF), same as the background. No door leaf."

$G $A/barnframe.png --size 360x400 --cutout --screen magenta "A wide rectangular opening for big double barn doors: a heavy surround of dark timber beams with iron brackets, a big fir wreath with a red bow hanging on the top beam, seen exactly front-on, flat, no perspective. The whole wide opening inside the beams is filled with flat pure magenta (#FF00FF), same as the background. No door leaves."

$G $A/candlestick.png --size 360x260 --cutout --screen magenta "A large ornate polished brass five-armed candlestick (a Scandinavian Christmas candelabra) standing on a small round base, the five arms curving up to five candle cups at the same height, five tall plain white unlit candles with black wicks, a few sprigs of fir and red berries around the base. Seen exactly front-on."

$G $A/flame.png --size 60x100 --cutout --model lite "A single small bright candle flame, teardrop shaped, yellow-white core with an orange edge, soft glow, nothing else, no candle."

$G $A/plaque.png --size 220x70 --cutout --screen magenta "A blank ornate rectangular brass sign plate with a bevelled edge, a fine engraved scroll border and decorative curled corners, a small round nail head at each end, seen exactly front-on. Plain polished warm brass in the middle, nothing written on it."

$G $A/peek-giftmachine.jpg --size 244x578 "$P a candlelit room with timber walls where a long wooden conveyor belt runs under three red-painted and brass machine heads hanging from brackets, a wrapped red present on the belt, puffs of steam."
$G $A/peek-wrapping.jpg --size 244x578 "$P a cosy room with a long oak table covered in rolls of red and green wrapping paper, spools of gold ribbon, big scissors, and wrapped presents stacked on shelves, pale snowy light from a frosty window."
$G $A/peek-stable.jpg --size 244x578 --people "$P a warm timber reindeer stable with wooden stalls, straw on the floor, hay racks, a wooden feed trough, and the head and antlers of a friendly reindeer looking out of a stall, lantern light."
$G $A/peek-postoffice.jpg --size 244x578 "$P a small timber post room with a tall wall of wooden pigeonholes stuffed with envelopes, sacks of letters on the floor, a sorting desk with a brass oil lamp."
$G $A/peek-sleigh.jpg --size 408x456 "A view straight through a wide open barn doorway into a timber sleigh shed, filling the entire image edge to edge, no door frame, no doors: a big red wooden sleigh with gold trim and curled runners in the middle, seen from the side, harness and sleigh bells hanging on the wall, hay on the floor, big open doors at the back showing snowy blue dusk, warm lantern light."
```

Clean-up with Pillow after generating:
- `peek-sleigh.jpg` came with a frame of its own despite "no door frame": cropped to the inner
  view (box (32,28,378,438)) and scaled back. `peek-giftmachine.jpg` was redone for the assembly line.
- `flame.png` (lite model, green screen) had a green fringe: pixels with g > r faded out.

Lessons: the "peek" images still sometimes draw a doorway; check and crop.
