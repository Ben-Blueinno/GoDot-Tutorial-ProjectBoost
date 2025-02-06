# GoDot Tutorial 1 - Project Boost (Fly A Rocket)

## Game Instructions

1. **Objective**: The goal of the game is to navigate your rocket through various levels, avoiding obstacles and reaching the landing pad safely.
2. **Controls**:
   - **Boost**: Press the `Space` key to activate the rocket's thrusters and boost upwards.
   - **Rotate Left**: Press the `A` key to rotate the rocket counterclockwise.
   - **Rotate Right**: Press the `D` key to rotate the rocket clockwise.
3. **Gameplay**:
   - **Starting the Game**: The game starts with the rocket on the ground. Use the boost and rotation controls to navigate.
   - **Avoid Obstacles**: Avoid hitting walls, moving hazards, and other obstacles. Colliding with them will cause the rocket to explode, and you will have to restart the level.
   - **Landing**: Carefully land the rocket on the designated landing pad to complete the level. The landing must be gentle; otherwise, the rocket will crash.
4. **Levels**:
   - The game consists of multiple levels, each with increasing difficulty. The levels are located in the `levels` directory and are named `level_1.tscn`, `level_2.tscn`, `level_3.tscn`, and `level_4.tscn`.
5. **Sound Effects**:
   - The game includes sound effects for various actions such as boosting, landing, and crashing. These sound effects are located in the `sound` directory.
6. **Particles**:
   - The game uses particle effects for visual enhancements, such as booster particles. These are located in the `Particles` directory.

## Project Structure

- **.godot/**: Contains Godot-specific configuration files.
- **.vscode/**: Contains Visual Studio Code settings.
- **build/**: Contains build outputs for different platforms (web, windows).
- **levels/**: Contains the level scenes.
- **sound/**: Contains sound effect files.
- **Particles/**: Contains particle effect scenes.
- **player.gd**: Script for the player (rocket) behavior.
- **player.tscn**: Scene for the player (rocket).
- **moving_hazard.gd**: Script for moving hazards.
- **moving_hazard.tscn**: Scene for moving hazards.
- **background.tscn**: Scene for the game background.
- **project.godot**: Main project configuration file.
- **README.md**: This file.

## How to Run the Project

1. **Open the Project**: Open the project in the Godot Engine by selecting the `project.godot` file.
2. **Run the Game**: Press the play button in the Godot editor to start the game.
3. **Build for Web**: To build the project for the web, use the export settings in Godot and select the web export preset.

Enjoy flying your rocket and completing the levels!
