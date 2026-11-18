# Art: kitchen

Generated with `scripts/gen-art.py` (Flash; the food icons with `--model lite`). Level 2 = white
limestone. `door.jpg` and `doorframe.png` are copied from the print shop. The liquid in the pot,
bubbles, steam, foam, smoke, flames, speech bubbles and numpad are drawn in code.
pot.png is 400x328 with its open mouth centred around (200, 42).

```bash
A=src/rooms/kitchen/assets; G="python3 scripts/gen-art.py"
$G $A/bg.jpg --size 1280x720 "A wide panoramic image of a completely flat back wall of a grand Renaissance castle kitchen on an upper floor, seen exactly straight-on, filling the whole image edge to edge with no black borders, no side walls, no corners: smooth pale white limestone ashlar walls. On the far left a large open limestone fireplace (hearth) about a third of the image wide, reaching down to the floor, with a low crackling log fire on its floor and an empty space above the fire; nothing standing in the fireplace, no pot, no cauldron. High up on the wall a long oak rack with polished copper pans and pewter plates, bunches of dried herbs and a string of garlic hanging, candlelight and firelight. A worn pale stone floor strip along the bottom sixth. The lower middle and right part of the wall are empty: no door, no table, no furniture."
$G $A/pot.png --size 400x360 --cutout "A large black cast-iron cooking cauldron with two side handles, standing on three short legs, empty, seen from the front and slightly above so the open round mouth at the top is visible as a dark ellipse. No fire, no lid, no stand, no floor."
$G $A/cook.png --size 340x520 --cutout --screen magenta --people "The head cook of a Danish Renaissance castle around 1600: a sturdy, rosy-cheeked middle-aged woman with a friendly but busy face, wearing a white linen coif on her head, a dark blue wool bodice over a white linen shirt with rolled-up sleeves, a long brown wool skirt and a large white linen apron. Standing full figure, empty hands, one hand raised as if talking, turned three-quarters towards the left of the image, looking to the left."
# cook-carry: two steps. First the pose (came out cropped at the knees), then zoomed out with that as reference.
$G $A/cook-carry.png --size 400x560 --cutout --screen magenta --people --ref $A/cook.png "Use the attached image only for the woman's face and clothes (white coif, dark blue bodice, white apron, brown skirt); change her pose completely. She stands full figure, turned towards the left, with BOTH arms wrapped around an enormous pile of raw food that she hugs against her chest: dozens of brown potatoes, yellow onions and long links of red sausages, the pile so big it reaches from her waist up above her head and is wider than her body, hiding most of her bodice and arms. Only her face peeks out at the side of the pile. No floor, no wooden boards, nothing on the ground, no table."
$G $A/cook-carry.png --size 400x600 --cutout --screen magenta --people --ref carry-cropped.png --ref $A/cook.png "Zoom out on the first attached image: exactly the same woman hugging the same enormous pile of potatoes, onions and red sausages, but now showing her ENTIRE figure from the top of her coif down to her shoes, with her long brown skirt reaching the floor like in the second attached image, and empty space around her. Small in the frame, nothing cropped. No floor, nothing on the ground."
$G $A/cook-happy.png --size 340x520 --cutout --screen magenta --people --ref $A/cook.png "Edit the attached image: exactly the same woman, same clothes, same pose, same size and framing, full figure, turned towards the left. Change only her face: a big warm delighted smile, eyes crinkled with joy, rosy cheeks."
$G $A/cook-frown.png --size 340x520 --cutout --screen magenta --people --ref $A/cook.png "Edit the attached image: exactly the same woman, same clothes, same pose, same size and framing, full figure, turned towards the left. Change only her face: a cross, disappointed frown, eyebrows pulled down, mouth turned down at the corners."
# table: two steps. First a long, low table (kept as table-low.png in the scratch folder), then its legs lengthened with it as reference.
$G table-low.png --size 420x200 --cutout --screen magenta "A long, narrow, shallow Renaissance kitchen work table of scrubbed pale oak, seen exactly front-on from just above the height of the tabletop so the top shows only as a thin strip, four sturdy square legs and a low stretcher bar near the floor. On the table: a wooden chopping board with a few chopped carrots and a small knife, a brown stoneware bowl, a round loaf of bread, a bunch of leeks and a small copper jug. Nothing under the table, no floor."
$G $A/table.png --size 420x300 --cutout --screen magenta --ref table-low.png "Edit the attached image: exactly the same long, narrow oak kitchen table with the same things on it, the same viewpoint and perspective, but with much longer legs, so the table is waist-high: the legs are about twice as long as now. Keep the low stretcher bar near the bottom of the legs. Nothing under the table, no floor."
$G $A/churn.png --size 120x300 --cutout "A tall wooden plunger butter churn from the 1600s: a slightly tapered cylinder of oak staves bound with three dark iron hoops, a wooden lid, and the long round wooden dasher handle sticking straight up out of the middle of the lid. Seen exactly front-on, standing on its own, no floor."
$G $A/potato.png --size 120x120 --cutout --model lite "One single raw brown potato, alone, front view."
$G $A/onion.png --size 120x120 --cutout --model lite "One single whole yellow-brown onion with dry papery skin and no green leaves, alone, front view."
$G $A/sausage.png --size 160x100 --cutout --model lite "One single short reddish-brown smoked sausage, slightly curved, alone, lying horizontally, side view."
```

Lessons: with `cook.png` as `--ref`, "carrying a heap of food" just copied the reference pose
(a few potatoes in one hand, food on the floor). Say "use the reference only for face and
clothes; change her pose completely", and "no floor". The model then cropped her at the knees
even with `--cutout`; a second pass "zoom out on the first attached image … entire figure"
fixed it. "Edit the attached image … change only her face" kept the pose and clothes exactly,
first try (cook-happy, cook-frown).

A fresh "waist-high table, one and a half times as wide as tall" came out with the wrong
perspective; editing the low table with "same table, much longer legs" kept it right.
table.png is 420x252: front legs end at y 251, back legs at y 228 (the back legs go on the floor line).

13 images in all (one cook retry, one zoom-out pass, one discarded table).
