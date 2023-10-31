# Pick In Store Employee App

A Flutter application designed for store employees to efficiently process "pick in store" orders.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
  - [Order Management](#order-management)
  - [Networking](#networking)
  - [Notifications](#notifications)
  - [Utilities](#utilities)
- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Contribution](#contribution)

## Overview

"Pick In Store Employee App" is tailored for store employees to manage and process orders that customers have placed online for in-store pickup. It ensures efficient and accurate order processing by helping employees verify the availability of ordered items and update the order status.

https://github.com/benyaminR/pick_in_store/assets/41753600/76ff960a-01cb-40bd-89f4-48c8117f77e0

## Features

### Order Management

Enables store employees to:
- View a list of incoming online orders designated for in-store pickup.
- Check and verify the availability of ordered items within the store.
- Update the order status (e.g., ready for pickup, waiting for restock, or completed).

### Networking

Handles all the API calls and networking-related tasks, ensuring real-time updates and synchronization. Main components include:
- **mock_up_service.dart**: Provides mock-up services or dummy data, which might be used for development or testing purposes.

### Notifications

Alerts store employees in real-time about:
- New incoming orders.
- Critical updates or changes to existing orders.

### Utilities

Consists of helper functions and utility code to support various application functionalities.

## Getting Started

1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to fetch the project dependencies.
4. Use `flutter run` to start the application.

## Dependencies

- Flutter SDK
- Cupertino Icons
- Get It (for dependency injection)

## Contribution

Contributions are welcome! Feel free to fork the repository, make changes, and submit pull requests. For significant changes, please open an issue first to discuss the proposed modifications.
