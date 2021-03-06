## App Maintenance Documentation

### Install Instructions
* Our app is built with Flutter. In order to maintain the app, the developer must have Flutter installed on their local machine. A detailed install walkthrough for different OS's can be found on Flutter's developer site: https://flutter.dev/docs/get-started/install. Once Flutter has been installed and the the Glyco repository is on your machine, in order to get the packages and dependencies, you must run "flutter pub get" in terminal to retrieve all of them. If using VS code, this is usually done automatically. It is also important to have Xcode installed if developing on Mac in order to have access to those developer tools. This can be done through the App Store. Once installed, you can run "open -a Simulator.app" in order to run the Glyco app on iOS simulation. Similarly, download Android studio for the Android side of the app for Flutter sicne it is cross platform. However, we focused on the iOS side of the app. Once all of the packages are grabbed by running "pub get" and having a simulator or iOS device conected, run "flutter run" in terminal to build the code and run it. Make sure you are in the glyco directory when executing "flutter run". 

### Open Source Tools and Libraries

* Flutter
* Font Awesome for Flutter
* Nano Healthkit
* fl_chart
* Cupertino Icons
* Mockito

* All of our packages and plugins we used as well as their versions can be found in our pubspec.yaml. The licenses for these packages and plugins can be found in our LICENSE_JUSTIFICATION.md as well. 

### Data Changes
* For the data components of our app, changes can be made in the Firebase connected to Glyco. This will be associated with the email of the client once the handoff is complete. For any key changes that need to be made, their login info for the Firebase will be needed to make changes. 