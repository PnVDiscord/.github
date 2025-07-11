// Background diagram for the banner image
//
// Reference:
//   https://github.com/napkin-community/solutions/blob/main/67C.typ
//   https://github.com/napkin-community/solutions/blob/main/Le14-5.3.8.typ

#import "@preview/fletcher:0.5.7" as fletcher: diagram, edge
#set page(fill: none)

#let node = (a, b, ..arg) => fletcher.node(a, text(blue, b), ..arg)
#let arrow = fletcher.edge.with(marks: "-|>")

#diagram(
  edge-stroke: blue,
  label-wrapper: edge => text(blue, [#edge.label]),
  node((0, 0), $(X times Y) times Z$, name: <XY_Z>),
  node((3, 0), $Y times Z$, name: <YZ>),
  node((2, -3), $X$, name: <X>),
  node((2, -1), $Y$, name: <Y>),
  node((2, 1), $Z$, name: <Z>),
  node((1, -2), $X times Y$, name: <XY>),
  node((4, -2), $X times (Y times Z)$, name: <X_YZ>),
  arrow(<XY_Z>, <XY>, label: $p := pi^(X times Y)_(X times Y, Z)$),
  arrow(
    <XY_Z>,
    <Z>,
    label: $q := pi^Z_(X times Y, Z)$,
    label-side: right,
    label-sep: 10pt,
  ),
  arrow(<YZ>, <Y>, label: $r := pi^Y_(Y, Z)$, label-side: left),
  arrow(<YZ>, <Z>, label: $s := pi^Z_(Y, Z)$, label-side: left),
  arrow(
    <X_YZ>,
    <X>,
    label: $u := pi^X_(X, Y times Z)$,
    label-side: right,
    label-sep: 10pt,
  ),
  arrow(
    <X_YZ>,
    <YZ>,
    label: $v := pi^(Y times Z)_(X, Y times Z)$,
    label-side: left,
  ),
  arrow(<XY>, <X>, label: $alpha := pi^X_(X, Y)$),
  arrow(<XY>, <Y>, label: $beta := pi^Y_(X, Y)$),
  arrow(
    <XY_Z>,
    <YZ>,
    label: text(green, $angle.l beta compose p, q angle.r$),
    stroke: (paint: green),
    label-side: right,
  ),
  arrow(
    <XY_Z>,
    <X_YZ>,
    label: text(
      green,
      $f := angle.l alpha compose p, angle.l beta compose p, q angle.r angle.r$,
    ),
    stroke: (paint: green),
    label-pos: 75%,
    label-angle: 21deg,
    label-sep: 3pt,
    label-side: right,
    bend: -4deg,
  ),
  arrow(
    <X_YZ>,
    <XY>,
    label: text(orange, $angle.l u, r compose v angle.r$),
    stroke: (paint: orange),
  ),
  arrow(
    <X_YZ>,
    <XY_Z>,
    label: text(
      orange,
      $g := angle.l angle.l u, r compose v angle.r, s compose v angle.r$,
    ),
    stroke: (paint: orange),
    label-pos: 75%,
    label-angle: 21deg,
    label-sep: 3pt,
    bend: -4deg,
  ),
)

#diagram(
  edge-stroke: blue,
  label-wrapper: edge => text(blue, [#edge.label]),
  node((0, 3), $X times Y$),
  edge(
    (0, 3),
    (5, 2),
    $f_2 compose f_1 compose p^(X, Y)_1$,
    "->",
    bend: 68deg,
    label-sep: 12pt,
    label-side: right,
  ),
  edge(
    (0, 3),
    (5, 4),
    $g_2 compose g_1 compose p^(X, Y)_2$,
    "->",
    label-sep: 12pt,
    bend: -75deg,
    label-side: left,
  ),
  edge((0, 3), (1, 2), $p^(X, Y)_1$, "->", label-sep: -4pt),
  edge((0, 3), (2, 3 - .5), $F((f_1, g_1))$, "->", label-angle: 13deg),
  edge(
    (0, 3),
    (4, 3),
    $F((f_2 compose f_1, g_2 compose g_1))$,
    "->",
    bend: -17deg,
    label-pos: 36%,
    label-angle: -4deg,
    label-side: left,
  ),
  node((1, 2), $X$),
  edge((1, 2), (3, 2), $f_1$, "->", label-sep: 2pt),
  edge(
    (0, 3),
    (1, 4),
    $p^(X, Y)_2$,
    "->",
    label-sep: 2pt,
    label-side: right,
  ),
  node((1, 4), $Y$),
  edge((1, 4), (3, 4), $g_1$, "->", label-sep: 2pt, label-side: right),
  node((2, 3 - .5), $Z times W$),
  edge((2, 3 - .5), (4, 3), $F((f_2, g_2))$, "->"),
  edge((2, 3 - .5), (3, 2), $p^(Z, W)_1$, "->", label-sep: -4pt),
  node((3, 2), $Z$),
  edge((3, 2), (5, 2), $f_2$, "->", label-sep: 2pt),
  edge(
    (2, 3 - .5),
    (3, 4),
    $p^(Z, W)_2$,
    "->",
    label-sep: 2pt,
    label-pos: 75%,
    label-side: right,
  ),
  node((3, 4), $W$),
  edge((3, 4), (5, 4), $g_2$, "->", label-sep: 2pt, label-side: right),
  node((4, 3), $A times B$),
  edge((4, 3), (5, 2), $p^(A, B)_1$, "->", label-sep: -4pt),
  node((5, 2), $A$),
  edge(
    (4, 3),
    (5, 4),
    $p^(A, B)_2$,
    "->",
    label-sep: 2pt,
    label-side: right,
  ),
  node((5, 4), $B$),
)
