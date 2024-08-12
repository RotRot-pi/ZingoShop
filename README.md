# Flutter E-commerce App (Single-Vendor)

This is a single-vendor e-commerce application built with Flutter for the frontend (user app, admin app, and delivery app) and PHP with MySQL for the backend.

## Table of Contents

* [Project Overview](#project-overview)
* [Features](#features)
* [Architecture](#architecture)
* [Frontend (Flutter)](#frontend-flutter)
* [Backend (PHP/MySQL)](#backend-phpmysql)
* [Firebase Integration](#firebase-integration)
* [Installation and Setup](#installation-and-setup)
* [API Documentation](#api-documentation) 
* [Screenshots](#screenshots)
* [Future Improvements](#future-improvements)
* [Contributing](#contributing) 

## Project Overview

This project aims to provide a complete e-commerce solution for a single vendor, allowing them to manage products, process orders, and interact with customers. The app is designed to be cross-platform, working on both Android and iOS devices. 

The system consists of three main Flutter applications:

* **User App:** Allows customers to browse products, add items to their cart, checkout, track orders, manage addresses, and view notifications.
* **Admin App:** Provides an interface for the vendor to manage products (add, edit, delete), process orders (accept/reject), view sales data, and configure app settings.
* **Delivery App:**  Enables delivery personnel to view assigned orders, update order statuses, and track delivery locations. 

## Features

* **User Authentication:** 
    * User registration and login using email and password.
    * Verification code sent to email for account activation.
    * Password reset functionality with email verification. 
* **Product Browsing:**
    * Browsing products by category.
    * Viewing product details (name, description, price, images).
    * Search functionality to find specific products.
* **Cart Management:**
    * Adding items to the cart.
    * Updating item quantities in the cart.
    * Removing items from the cart.
* **Checkout:**
    * Selection of shipping address (if applicable).
    * Choice of payment method (cash on delivery, payment cards).
    * Applying coupon codes for discounts.
    * Order confirmation.
* **Order Management:**
    * Viewing pending orders.
    * Viewing order history (archived orders).
    * Viewing order details.
    * Canceling orders (if allowed by the vendor's policy).
    * Rating completed orders. 
* **Address Management:**
    * Adding, editing, and deleting shipping addresses.
    * Integration with Google Maps for address selection and validation.
* **Notifications:**
    * Push notifications for order updates, promotions, etc. (powered by Firebase Cloud Messaging).
* **Admin Features:**
    * Product management (add, edit, delete products, categories).
    * Order management (accept, reject, prepare orders).
    * Configuration of app settings (e.g., delivery time, home screen content).
* **Delivery Features:**
    * Viewing assigned orders.
    * Updating order statuses (e.g., picked up, on the way, delivered).
    * Real-time order tracking using Google Maps.

## Architecture 

* **Frontend (Flutter):**  The Flutter apps follow the Model-View-Controller (MVC) pattern to organize code and separate concerns. The project uses the `Get` package for state management and navigation.
* **Backend (PHP/MySQL):**  The backend is built with PHP and uses a MySQL database. The code is structured into folders for different features (authentication, categories, items, orders, etc.) and includes utility functions for common tasks.
* **Communication:** The frontend and backend communicate using a RESTful API. Data is exchanged in JSON format.

## Frontend (Flutter)

* **Code Organization:** 
    * `lib/`:  Contains the main source code for each Flutter app.
    * `lib/bindings/`:  Handles dependency injection.
    * `lib/core/`:  Includes core classes, constants, functions, localization, middleware, and services.
    * `lib/data/`: Contains data models and data sources (remote and static).
    * `lib/controller/`:  Houses the logic for different screens and features.
    * `lib/view/`:  Defines the UI for each app.
* **Key Packages:**
    * `flutter_screenutil`: For responsive UI design.
    * `cached_network_image`: For efficient image loading.
    * `get`:  For state management and navigation. 
    * `flutter_map`: For integrating Google Maps (order tracking).
    * `firebase_messaging`: For push notifications. 

## Backend (PHP/MySQL)

* **Code Organization:** 
    * `connect.php`:  Database connection setup.
    * `functions.php`:  Utility functions (e.g., image upload, notifications).
    * `view.sql`: SQL code for database views.
    * Feature-specific folders (e.g., `auth`, `categories`, `items`, `orders`, `notification`).
* **API Endpoints:** The backend exposes RESTful API endpoints for handling requests from the Flutter apps. 

## Firebase Integration

Firebase Cloud Messaging (FCM) is integrated into the project for sending push notifications to users about order updates and other relevant events. 

## Installation and Setup

1. **Clone the repository:**  `git clone [repository url]`
2. **Install Flutter dependencies:**  `flutter pub get` (in each Flutter app directory)
3. **Set up the backend:** 
    * Create a MySQL database and import the database schema. 
    * Configure the database connection in `connect.php`.
    * Deploy the PHP backend code to a web server. 
4. **Configure Firebase:**
    * Create a Firebase project and obtain the necessary configuration files.
    * Add the Firebase configuration to the Flutter apps.
5. **Run the Flutter apps:** `flutter run` (in each Flutter app directory)

## API Documentation

[Provide detailed documentation for your backend API endpoints, including request parameters, responses, and example usage. You can use a tool like Postman or Swagger to generate documentation.]

## Screenshots 

[Include screenshots of the user, admin, and delivery apps to visually showcase the project.]

## Future Improvements

* **Payment Integration:** Integrate with a payment gateway to handle secure online transactions.
* **User Reviews:**  Allow users to leave reviews for products.
* **Advanced Search/Filtering:** Implement more sophisticated search and product filtering options.
* **Enhanced Security:** Conduct a security audit and implement robust measures to prevent common vulnerabilities (SQL injection, XSS, etc.).
* **Extensive Testing:** Write unit, integration, and end-to-end tests to ensure code quality and app reliability.
* **Performance Optimization:** Optimize database queries and backend architecture for scalability.

## Contributing

Contributions to the project are welcome! Feel free to open issues for bug reports or feature requests.
