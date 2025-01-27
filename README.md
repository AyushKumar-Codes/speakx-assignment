# **SpeakX Assignment**
<img src="https://github.com/user-attachments/assets/3147bd02-4f4e-43d7-a3d1-4283598d3e1e" width="100" height="100">

## **Description**
This assignment involves the implementation of a **Flutter app** that handles dynamic data loading and search functionalities with optimized state management using **Riverpod**. The app showcases a list of items, supports both infinite scrolling for loading more data and searching through the list, with additional shimmer effects during loading states. The app is designed to provide a seamless user experience, simulating network delays to mimic realistic data fetching scenarios.

---

## **Features**
- **Search Functionality**: Users can search for items by typing a query into the search bar.
- **Infinite Scrolling**: Items are dynamically loaded as the user scrolls, both upwards and downwards.
- **Shimmer Loading Effect**: While data is being loaded, a shimmer effect is displayed as a placeholder.
- **State Management**: Efficient state management using **Riverpod** to handle the loading and data states.

---

## **Installation**

To run this project on your local machine, follow these steps:

### 1. **Clone the Repository**
Clone the repository to your local machine using the following command:

git clone <repository_url>
text

### 2. **Navigate to the Project Directory**
Change to the project directory:

cd <project_directory>
text

### 3. **Install Dependencies**
Make sure you have Flutter and Dart installed on your machine. Run the following command to install the required dependencies:

flutter pub get
text

### 4. **Run the Project**
After installing dependencies, use the following command to launch the app on an emulator or physical device:

flutter run
text

---

## **Usage**
Upon running the app, you'll be presented with a list of items. You can use the following features:
- **Search**: Type into the search bar to filter through the list of items.
- **Scroll**: Scroll down to load more items dynamically or scroll up to load items above.
- **Shimmer Effect**: While new data is being fetched, a shimmer effect will display as a placeholder.

---

## Screenshots

| **Screen**       | **Screenshot**                                                                                  |
|-------------------|-----------------------------------------------------------------------------------------------|
| **Main Screen**   | <div style="text-align: center;"><img src="https://github.com/user-attachments/assets/a18d795c-6e6c-49a6-8f0f-a5a4dd121717" width="300" height="500"></div> |
| **Search Screen** | <div style="text-align: center;"><img src="https://github.com/user-attachments/assets/ee4d10fe-0eb9-44c9-996d-8e740a37fba6" width="300" height="500"></div> |
| **Loading State** | <div style="text-align: center;"><img src="https://github.com/user-attachments/assets/7840c2da-2f64-406c-b462-1adab7cc59d3" width="300" height="500"> <img src="https://github.com/user-attachments/assets/b5b2d6bd-b0ba-42e4-88ac-a60be4b15fc6" width="300" height="500"></div> |




---

## **Video Demonstration**
[Watch Video Demonstration]([path_to_video_link](https://drive.google.com/file/d/10djmGHaBiqGwRNHZ29Q1s33HzfnY3ewY/view?usp=drive_link))

---

## **Code Overview**
The app is structured as follows:
- `main.dart`: Contains the core app structure, including the initialization of Riverpod and the HomePage widget.
- `user_viewmodel.dart`: Contains the UserViewModel class, which handles the state for loading items and searching functionality.
- State Providers: Managed using Riverpod for handling dynamic changes such as loading data and performing search queries.

---

## **Commands for Flutter**

### Run the App
After setting up the project, run the following command to launch the app:

flutter run
text

### Clean the Project
To clean up any cached data, use:

flutter clean
text

### Get Dependencies
To fetch all the necessary packages and dependencies:

flutter pub get
text

### Upgrade Dependencies
To upgrade all the dependencies to their latest versions:

flutter pub upgrade
text

---

## **Contributing**
If you wish to contribute to this project, follow these steps:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Create a new Pull Request.

---

## **License**
This project is licensed under the MIT License.

---

## **Acknowledgements**
- Flutter: For the cross-platform app development framework.
- Riverpod: For efficient state management.
- Shimmer: For creating the shimmer effect to indicate loading.
