# Flutter - Firebase Push Notification | Bloc state management
## 

## App Features
- Login and Signup via firebase authentication
- Bloc State management to manage the state inside the app
- Implemented Firebase Push Notification works when app is in background.

# How to use it
- Create a new Firebase project in the Firebase console. Go to the Firebase console (console.firebase.google.com) and click on "Add project". Give your project a name and follow the instructions to set it up.

- Update the google-services.json file. After creating the Firebase project, download the google-services.json file from the Firebase console. Place this file inside the app folder of your Flutter project.

- Update the DefaultFirebaseOptions file. Open the DefaultFirebaseOptions file in your Flutter project and update the relevant field properties to match your Firebase project details. This includes fields like the Firebase API key, project ID, and other configuration settings.

- Run the app on a real device. Use Android Studio or Visual Studio Code to run the app on your physical device. Make sure the device is connected properly and recognized by your development environment.

- Sign up or log in to the app. Once the app is running on your device, sign up or log in to the app using the provided authentication functionality. This will allow you to access the app's homepage.

- Obtain the device token. On the app's homepage, you will find your device token displayed. Copy this token to the clipboard.

- Configure notifications in Firebase console. Go back to the Firebase console and navigate to the messaging or notification section. Create a new notification and paste your device token when prompted. This ensures that the notification is sent to your specific device.

- Test the notification. With the notification configured in the Firebase console, you should receive a notification on your real device. This confirms that the integration between your Flutter app and Firebase messaging is working correctly.

# App Screen Shot
![screen-notification-app.png](https://i.postimg.cc/d16h9n9H/screen-notification-app.png)

# Author
Ankit Dwivedi
