Pick In Store
A Flutter application designed for in-store pick-up functionalities.

Overview
"Pick In Store" is a mobile application built using Flutter. It streamlines the process of ordering products and picking them up in-store. With a user-friendly interface, it integrates various features from order processing to user authentication.

Features
Home
The central hub for accessing all the application's features. The home module is structured as follows:

Controller: Handles user interactions and updates the view.
Model: Contains the data structures representing the application's data related to the home feature.
Views: UI components or screens related to the home feature.
Networking
Manages all the API calls and networking-related tasks. The main components include:

mock_up_service.dart: Provides mock-up services or dummy data for networking tasks. This might be used for development or testing purposes.
Notifications
Manages and triggers in-app notifications.

Order Processing
Allows users to place, view, and manage their orders. The order module is structured as:

Controller: Contains logic related to order processing.
Model: Data structures or objects related to orders.
View: UI components or screens related to the order feature.
In-Store Pick-Up
Facilitates the process for users to pick up their orders from a physical location.

User Authentication
Provides sign-in and authentication functionalities.

Utilities
Contains helper functions and utility code.

Getting Started
Clone the repository.
Navigate to the project directory.
Run flutter pub get to fetch the project dependencies.
Use flutter run to start the application.
Dependencies
Flutter SDK
Cupertino Icons
Get It (for dependency injection)
Contribution
Feel free to fork the repository, make changes, and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.
