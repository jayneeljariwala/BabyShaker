# BabyShaker Game Clone

## Overview

This project is a clone of the controversial BabyShaker game, which was released on the iOS App Store in 2009 but later removed due to public outcry. This project replicates the functionality of the original game for educational purposes, focusing on iOS development skills such as gesture recognition, animations, and sound integration.

> **Disclaimer:** This project is strictly for learning purposes and does not endorse or promote harmful behavior.

## Features

- **Shake Gesture Detection**: The app uses the device's accelerometer to detect shake gestures.
- **Animations**: A simple fade-out animation plays when the baby is "calmed" after shaking.
- **Sound Effects**: A crying baby sound plays continuously until the user shakes the device to calm the baby, triggering another sound.
- **UI Components**: The app features a baby image and simple UI interactions.
  
## Technologies Used

- **Swift**: The project is written in Swift.
- **UIKit**: Used for the UI components and layout.
- **AVFoundation**: Used for audio playback of sound effects.
- **Auto Layout**: Ensures the UI is responsive across different devices.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/babyshaker.git
    ```

2. Open the project in Xcode:

    ```bash
    cd babyshaker
    open BabyShaker.xcodeproj
    ```

3. Build and run the app on a physical device (shake gesture detection is only supported on actual devices, not simulators).

## How to Play

1. Launch the app.
2. A baby crying sound will play in a loop.
3. Shake the device to calm the baby, triggering an animation and changing the sound.
4. After a few seconds, the crying sound will resume, and the player can repeat the shake to calm the baby again.


