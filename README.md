# Godot Pong

A dynamically-scaled Pong variant built in Godot, designed to run on Web, Android, and Windows (plays best on Android). The layout is built around a 720×1280 portrait reference resolution and scales to fit whatever screen it's running on. All pixel art was custom made for this project, using piskel. This project was made for Programming 12 Class.

## Modes

- **Single Player** — endless survival: keep the ball alive off your paddle for as long as possible. The ball speeds up and spins faster with every successful hit; missing it ends the run.
- **Two Player (local)** — one paddle at the bottom, one at the top, sharing a device.
- **Player vs. CPU** — same layout, but the top paddle is AI-controlled, with three difficulty levels (Easy / Medium / Hard) that scale the CPU's reaction speed and add small imperfections so it isn't a perfect wall.

There's also a sprite switcher for cycling through different ball skins before a match.

## Requirements

- [Godot Engine](https://godotengine.org/download) 4.3+

## Running it

1. Open Godot, choose **Import**, and select `project.godot` from this repo.
2. Press Play — it starts on the title screen.

## Controls

| Input | Action |
|---|---|
| Drag / touch the paddle | Move it directly (mouse or touch) |
| `←` / `→` | Move Player 1's paddle |
| `A` / `D` | Move Player 2's paddle (2-player mode) |
| Two-finger touch (mobile) | Independently drag the top and bottom paddles at once |

## Project structure

```
project.godot          Project configuration (portrait viewport, input map, autoload)
TitleScreen.tscn        Title screen
node_2d.tscn            Single-player scene
2player.tscn            Local 2-player scene
cpuvsplayer.tscn        Player vs. CPU scene
node.gd                 Autoloaded singleton (PlayerSelection) — selected sprite, CPU difficulty, ball speed
ballbounce.gd / singleball.gd   Ball physics — bounce, speed/spin ramp-up, scoring, death state
movement.gd / movement2pyer.gd  Player 1 paddle controller (drag/touch + keyboard)
player2.gd              Player 2 paddle controller (keyboard)
cpu.gd                  AI paddle controller, speed set by difficulty
boundaries.gd / boundarymovement.gd   Aligns level boundary walls to the viewport at runtime
scale.gd                Scales the scene relative to the 720×1280 reference resolution
drag2player.gd          Independent two-finger touch dragging for local mobile 2-player
modeselect.gd / title_screen.gd   Menu navigation between title, mode select, and game scenes
switchplayer.gd         Cycles through selectable ball sprites
export_presets.cfg      Export configuration for Web / Android / Windows builds
```

## Building / exporting

Export presets for Web, Android, and Windows are already configured in `export_presets.cfg` (**Project → Export** in the Godot editor). A signed Android build is available under [Releases](../../releases).

## Notes

An optional editor plugin (WakaTime time-tracking) is referenced in `project.godot` but not included in this repo — Godot will simply skip it if the `addons/` folder isn't present, with no effect on the game itself.
