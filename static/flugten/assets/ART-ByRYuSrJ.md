# Art: gunpowder

Generated with `scripts/gen-art.py` (Flash; the scoops with `--model lite`). Copied (no cost):
`door.jpg`, `doorframe.png` (gear train), `parchment.png` (print shop), `board.png` (the
star window's shortened slate), `keg.png` (the storeroom's `barrel.png`), and `lid.png`, cut
from this room's `table.png` (x 200–316, rows 0–14: the top board seen edge-on). The recipe text, fractions, slate tally, the painted number on
the keg, its fuse, the powder heap, sparks, smoke and dust are drawn in code.

```bash
A=src/rooms/gunpowder/assets; G="python3 scripts/gen-art.py"
$G $A/bg.jpg --size 1280x720 "A wide panoramic image of one completely flat back wall of a gunpowder workshop in the basement of a Renaissance castle, seen exactly straight-on like a theatre backdrop. The wall continues all the way to the left and right edges of the image: no side walls, no corners, no vault, no perspective, no black borders. Old red brick blackened with soot in places, a few rough limestone blocks set into it, scorch marks, one candle in a wrought-iron wall sconce near the far left edge, a worn flagstone floor strip along the bottom tenth. The wall is otherwise completely empty: no door, no shelves, no furniture, no barrels."
$G $A/table.png --size 640x260 --cutout "A long heavy Renaissance workbench of dark scarred oak, seen exactly front-on from just above the height of the top so the top shows only as a thin strip, four thick square legs and a low stretcher bar, a few burn marks. The top is completely empty. The whole table visible, nothing cut off, no floor."
$G $A/jar-saltpeter.png --size 160x180 --cutout "An open wide-mouthed glazed brown stoneware crock, seen exactly side-on at eye level, the camera at the height of the rim, so the rim is an almost straight horizontal line and the inside cannot be seen; the contents are piled up in a rounded mound that rises above the rim, so they show: white crystalline saltpeter. The whole crock visible, nothing cut off."
$G $A/jar-sulfur.png --size 160x180 --cutout --screen magenta "An open wide-mouthed glazed grey stoneware crock, seen exactly side-on at eye level, the camera at the height of the rim, so the rim is an almost straight horizontal line and the inside cannot be seen; the contents are piled up in a rounded mound that rises above the rim, so they show: bright yellow sulfur powder. The whole crock visible, nothing cut off."
$G $A/basket-coal.png --size 180x160 --cutout "A small round wicker basket, seen exactly side-on at eye level, the camera at the height of the rim, so the rim is an almost straight horizontal line and the inside cannot be seen; the contents are piled up in a rounded mound that rises above the rim, so they show: black lumps of charcoal. The whole basket visible, nothing cut off."
$G $A/rubble.png --size 360x340 --cutout "A tall mound of fallen rough limestone rocks and broken red bricks piled up high, seen from the side at eye level like a small hill: a rounded, irregular mound silhouette, wide at the bottom and narrowing to a rough peak at the top, a few rocks sticking out. Only the heap, the whole heap visible, nothing cut off, no wall, no floor, not seen from above."
$G $A/scoop-saltpeter.png --size 120x80 --cutout --model lite "A small wooden scoop with a short handle, seen from the side, heaped with white saltpeter crystals. Nothing else."
$G $A/scoop-sulfur.png --size 120x80 --cutout --screen magenta --model lite "A small wooden scoop with a short handle, seen from the side, heaped with bright yellow sulfur powder. Nothing else."
$G $A/scoop-coal.png --size 120x80 --cutout --model lite "A small wooden scoop with a short handle, seen from the side, heaped with small black charcoal pieces. Nothing else."
```

Lessons: "a heap of rocks … seen exactly front-on" came out as a flat square patch seen from
above; "a tall mound … seen from the side at eye level like a small hill … not seen from
above" gives a heap. Sulfur is yellow, so it is keyed on magenta, not green. The first crocks were "seen
front-on from slightly above", looking into them, which clashed with the table seen at eye
level; asking for the camera at the height of the rim with the contents heaped above it fixed it.

The mixing bowl (`bowl.png`) was replaced by the keg; a new keg could not be generated
(the Gemini account returned 402 Payment Required), so the storeroom's barrel is reused.
