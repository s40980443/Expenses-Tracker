import 'package:flutter/material.dart';
import 'package:my_app4/pages/add.dart';
import 'package:my_app4/pages/analysis.dart';
import 'package:my_app4/pages/calendar.dart';
import 'package:my_app4/pages/home.dart';
import 'package:my_app4/pages/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


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




