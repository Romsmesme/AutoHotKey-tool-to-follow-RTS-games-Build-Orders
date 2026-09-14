# BuildOrderAssistant

A lightweight AutoHotkey v2 overlay that lets you follow build orders while playing your game.

# What is BuildOrderAsistant?

BuildOrderAssistant is an AutoHotKey v2 tool designed to help players follow a predefined build order while playing a game.

The application displays the current build order step in a small overlay above the game. Pressing a configurable hotkey advances to the next step, allowing you to follow a build order without having to constantly switch between the game and an external guide, and without the need of a second monitor.

It was originally created for Age of Empires II HD, but the overlay itself is game-agnostic and can potentially be used with any game where players follow a predefined sequence of actions.

# Features

- Follow custom build orders step-by-step
- Overlay displayed directly over the game
- Advance to the next step using a hotkey
- Configurable hotkeys
- Lightweight — written in AutoHotKey v2
- Game-independent overlay system.

## What it does

Upon starting the tool, you will have to choose the build order you want to follow for the current game from the dropdown menu. Build orders are not provided, you will have to make your own .txt documents with your custom build orders.

It then creates an overlay window positioned above the game window, where your build order name will be displayed, alongside the first few steps of your build.

When the configured hotkey is pressed, the application advances to the next step in the build order. The current step is displayed in red, the step before is green, the ones after are grey.

The hotkeys are tweakable, as well as all the display settings (colors used, window position and transparency, amount of steps showed at the same time, etc.). This can be done by right-clicking the file and selecting "Edit script". Feel free to reach me out if you need any help with this part.

## What it doesn't do

- It doesn't read the game's memory.
- It doesn't automatically detect when you've completed a step.
- It doesn't automate gameplay.
- It doesn't control your units or your buildings.

## Requirements

- Windows
- AutoHotKey v2

## Installation

1. Install AutoHotKey v2
2. Download the BuildOrderAssistant.ahk GitHub file
3. Put the .exe file in the same folder than your custom .txt build orders
4. Run the .exe file, choose the desired build order.
5. Press F1 to validate the first step, and any step after that.
6. Upon reaching the last step, pressing F1 will close the tool. Pressing F4 at any moment will also close the tool.

## Creating Build orders

This need to be done in a .txt file (with Notepad for example). Originally, build order files must be within the same folder than the .ahk file. This can be changed in the AHK code.

Build orders must be written as follow. There's not limit to the number of steps.

Build order name
Step 1
Step 2
Step 3
...

## Need help?

Feel free to reach me out on Discord for any request or help with configuration or settings: blblbl_



ENJOY !
