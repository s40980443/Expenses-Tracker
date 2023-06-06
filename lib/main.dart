import 'package:flutter/material.dart';
import 'package:my_app4/pages/add.dart';
import 'package:my_app4/pages/analysis.dart';
import 'package:my_app4/pages/calendar.dart';
import 'package:my_app4/pages/home.dart';
import 'package:my_app4/pages/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Programming Languages: Dart
// Frameworks: Flutter SDK
// Backend Services: Firebase (Firebase Cloud Firestore and Firebase Authentication)
// State Managements: Provider
// Configuration: Flavor, Flutter Dotenv
// Notifications: Flutter Local Notifications
// Caching Services: Hive
// UI Tools: Figma, Canva
// All Packages and Libraries:
// Name	Version	Description
// build_runner	^2.3.3	A tool to compile and package Dart code.
// cloud_firestore	^4.4.3	A library for using Firebase Cloud Firestore.
// cupertino_icons	^1.0.2	A library to use Cupertino icons, which are iOS-style icons.
// encrypt	^5.0.1	A library for encrypting data.
// firebase_auth	^4.2.10	A library for authenticating users with Firebase.
// firebase_core	^2.7.0	A library for using base Firebase features.
// fl_chart	^0.61.0	A library for creating charts.
// flavor	^2.0.0	A tool for creating different flavors of an app.
// flutter_colorpicker	^1.0.3	A widget for picking colors in Flutter.
// flutter_datetime_picker	^1.5.1	A library for picking dates and times.
// flutter_dotenv	^5.0.2	A library to load environment variables from a .env file.
// flutter_gen_runner	^5.1.0+1	A tool for generating Dart code.
// flutter_local_notifications	^13.0.0	A library for displaying local notifications.
// font_awesome_flutter	^10.4.0	A library to use Font Awesome icons.
// google_sign_in	^6.0.2	A library for signing in with Google.
// hive	^2.2.3	A lightweight and fast key-value database for mobile devices.
// hive_flutter	^1.1.0	Hive’s official Flutter integration.
// intl	^0.17.0	A library for internationalizing Flutter apps.
// logger	^1.3.0	A logging utility for Dart and Flutter.
// mailer	^6.0.0	A library for sending emails.
// permission_handler	^10.2.0	A library for requesting and checking permissions on mobile devices.
// pin_code_fields	^7.4.0	A widget for creating and validating pin codes.
// provider	^6.0.5	A state management solution for Flutter.
// share_plus	^6.3.1	A library for sharing content from Flutter apps.
// showcaseview	^2.0.3	A widget for showcasing app features with a step-by-step guide.
// table_calendar	^3.0.8	A widget for displaying a calendar with events.
// timezone	^0.9.1	A library for working with time zones in Dart.
// url_launcher	^6.1.10	A library for launching URLs.





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// void main() async{
//   runApp(MyApp());
//   // Firebase
//   Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
// }


// void main() => runApp(MyApp());





class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  //Analytics
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: BottomNavigationController(),
      )
    );
  }
}











class BottomNavigationController extends StatefulWidget {
  BottomNavigationController({Key? key}) : super(key: key);

  @override
  _BottomNavigationControllerState createState() => _BottomNavigationControllerState();
} //

class _BottomNavigationControllerState extends State<BottomNavigationController> {

  int _currentIndex = 0;
  final pages = [Analysis(),AddTaskAlertDialogState(),Calendar()];
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Expenses Tracker"),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(

          items: <BottomNavigationBarItem>[ 
          // BottomNavigationBarItem( icon: Icon(Icons.home),label: '首頁', backgroundColor: Colors.black ),
          BottomNavigationBarItem( icon: Icon(Icons.analytics),label: '分析', backgroundColor: Colors.black ),
          BottomNavigationBarItem( icon: Icon(Icons.add) ,label: '新增', backgroundColor: Colors.black),
          BottomNavigationBarItem( icon: Icon(Icons.calendar_month) ,label: '日期', backgroundColor: Colors.black),
          // BottomNavigationBarItem( icon: Icon(Icons.settings),label: '設定' , backgroundColor: Colors.black),
          
          ], 
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          fixedColor: Colors.amber,
          backgroundColor: Colors.white
          ),
          
      );
    }


    void _onItemTapped(int index){
      setState(() {
        _currentIndex = index;
      });
    }
}




