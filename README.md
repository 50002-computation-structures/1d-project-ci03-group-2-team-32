# 2025 50.002 1D Project

![Arcade Machine Project](https://drive.google.com/uc?id=1bPgjYnJbKQIEttYv0AW8WhygEeJFdnh-)

## Project Overview
Full report: ![here](https://docs.google.com/document/d/1i55QxqdQVxekoRKUC-4VbMoP-OCmX_1RQGvkN3SKQEw/edit?usp=sharing)
For our 50.002 Computation Structures project, we built an arcade machine using a single 𝗔𝗹𝗰𝗵𝗶𝘁𝗿𝘆 𝗔𝘂 𝗙𝗣𝗚𝗔 (Xilinx Artix 7). The machine features:

- 🔳 **16x16 LED Matrix:** Serves as the display screen, with each individual LED programmed for custom graphics.
- ▶️ **Movement & Shoot Buttons:** Hardware is programmed with edge detectors to accurately detect single button presses across clock cycles.
- 🔢 **Seven Segment Displays:** Used to show score and time. Data from regfiles is converted to binary for correct number display.
- 🖥️ **Beta CPU and Instruction Set Architecture:** Designed and implemented with a program counter, REGFILE, ALU, and Control Unit, all coded as Alchitry Lucid modules.

## Team Members

- [Elizabeth](https://github.com/ELIBERP)
- [Zhi Xun](https://github.com/zed-ex)
- [Janelle](https://github.com/janfjxuan)
- [Jana](https://github.com/janaleong)
- [Natasha](https://github.com/natasha-sutd)
- [Ky](https://github.com/Kydinhvan)
- [Freddie](https://github.com/FredSterz)

## Beta CPU Datapath

![Beta CPU Datapath](https://drive.google.com/uc?id=1RDd59E7DtQBaoqAxMRoyGrDUh-20KJFI)

### Datapath Components
- Dual-port REGFILE with WE control
- ROM/RAM I/O mapped to screen matrix
- WDSEL multiplexers to combine ROM outputs for enemy configuration
- CU takes inputs from:
  - Clock edges (game timer, animation)
  - User input
  - Enemy and bullet state flags

### RAM & ROM
- **RAM (2048 bits)**:
  - 256 pixels × 3 bits/pixel = 768 bits used for RGB matrix
  - Extra space ensures smooth refresh cycles
- **ROM**:
  - Stores static content: wave data, endgame screen, patterns

### Register File (REGFILE)
- **21 registers**, each 32-bit wide
- Addressed via 5-bit select lines
- Holds player position, bullet data, score, timer, and enemy information

### LED Matrix Display
- Controlled via WS2812B driver
- Driven from RAM content updated by FSM + CPU logic
- Refresh cycles managed by dedicated slow clock

### UI Interaction
- **7 Buttons**: LEFT, RIGHT, RED, GREEN, BLUE, START, RESET
- **Score/Timer**: 2-digit 7-segment display via decoded register output
- **Matrix**: Player, bullets, and enemies updated in real time

## Fixed State Machine (FSM)

![Fixed State Machine (FSM)](https://drive.google.com/uc?id=1p2g_cbhQf4OOoJqhK9_C0jr8uwwUj4j_)

### FSM Control Logic 
The FSM manages the game flow with multiple states:
- **Initialization**: Sets up enemies, resets state
- **Idle**: Listens for player inputs
- **Bullet Logic**: Handles bullet color, movement, and encoding
- **Enemy Wave Logic**: Spawns new enemies upon wave clear
- **Collision Detection**: Checks for valid hits based on bullet color and coordinates
- **Timer Management**: Countdown from 60 seconds using slow clock
- **End Game**: Displays score and halts game

The FSM is designed as a **Mealy machine**, where outputs depend on both the current state and inputs.

## Prototype Demo
Watch the Youtube Short below for our prototype video!

[![Watch the Prototype Demo](https://img.youtube.com/vi/AH0uyNu-OIY/maxresdefault.jpg)](https://youtube.com/shorts/AH0uyNu-OIY?feature=share)

All tests validate state transitions and datapath correctness.
## Initial Readme
This starter template is created using Alchitry Lab V2, written in LucidV2 language. Full documentation can be found at [Alchitry's official website](https://alchitry.com/tutorials/).
