[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/pVeRSSal)
# IBOutlet Exercises
## First Challenge - Lamp
Create an application that simulates being the control of a lamp.

Upon entering the application, a launch screen should be displayed. Once the application is open a black screen should be displayed to simulate that the lamp is turned off.

The interface should include a button that toggles between _Turn On_ and _Turn Off_ according to the current state of the lamp.

If the button displays _Turn On_, pressing it should change the background of the screen to white, simulating that the lamp has been turned on.
If the button displays _Turn Off_, pressing it should change the background of the screen to black, simulating that the lamp has been turned off.

### Extra Challenge (optional)
To enhance the user experience, two images related to a lamp states should be included. These images should be visible according to the lamp's state (_on_ or _off_).

> **Note:**
> Ensure that you implement the logic for changing the background and the visibility of the lamp images consistently with the current state of the lamp.

## Second Challenge - RGB Colors
Develop an application that allows users to explore and adjust RGB colors using sliders.

The application will consist of three sliders, each representing one of the RGB color components (Red, Green, and Blue).

- When any of the sliders is moved, the application should update the background color in real-time. This will allow users to experiment with different color combinations interactively.
- Next to each slider, a label will be displayed indicating the numerical value selected on that slider.

Add a "Reset" button that will allow users to revert to the default color values (for example, black).


## Third Challenge - Login
In the [login project from the storyboard-exercises](https://github.com/iOSLabUNAM/storyboard-exercises#login), is necessary to connect all components and provide functionality. 

A users should be able to access using the following login information:
```
Username: Diplomado2024
Password: YourName_BirthMonth
```

Consider the following points:
- If the text fields are empty, the _Login_ button should be disabled.
- When data is entered in both fields, the button should be automatically activated.
- In case the username or password is incorrect, a native alert should be displayed informing the user that the data is incorrect.
- If the login information is correct, the user should be redirected to a welcome screen, where a welcome message should be displayed along with their username.

### Extra Challenge (optional)
The password text field should have the ability to hide the entered text. This should be implemented using the native password hiding feature to enhance application security.

> **Note:**
> If you haven't completed this exercise in the previous attempt, we encourage you to finish it and continue working on it to achieve a successful implementation
