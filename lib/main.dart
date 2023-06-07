

import 'package:flutter/material.dart';

//pages
import 'package:my_app4/pages/add.dart';
import 'package:my_app4/pages/analysis.dart';
import 'package:my_app4/pages/calendar.dart';
import 'package:my_app4/pages/pie.dart';
import 'package:my_app4/pages/setting.dart';

import 'package:my_app4/pages/auth/signin.dart';
import 'package:my_app4/pages/auth/signup.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';



// void main() async{
//   runApp(MyApp());
//   // Firebase
//   Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
// }


// void main() => runApp(MyApp());




Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
  User? user = FirebaseAuth.instance.currentUser;
  Widget firstWidget;
  if(user != null){
    //以登入
    firstWidget =  BottomNavigationController();
  }else{
    firstWidget = SignUp();
  }

    return MaterialApp(
  
      home: Scaffold(
        
        // body: BottomNavigationController(),
        body: firstWidget,
        
      )
    );

  }
}












class BottomNavigationController extends StatefulWidget {
  // BottomNavigationController({Key? key}) : super(key: key);

  @override
  _BottomNavigationControllerState createState() => _BottomNavigationControllerState();
} //

class _BottomNavigationControllerState extends State<BottomNavigationController> {


  int _currentIndex = 0;
  final pages = [AddTaskAlertDialogState(),Pie(),Analysis(),Calendar(),Setting()];



    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Expenses Tracker"),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(

          items: <BottomNavigationBarItem>[ 
            BottomNavigationBarItem( icon: Icon(Icons.add) ,label: '新增', backgroundColor: Colors.black),
          BottomNavigationBarItem( icon: Icon(Icons.pie_chart),label: '首頁', backgroundColor: Colors.black ),
          BottomNavigationBarItem( icon: Icon(Icons.analytics),label: '分析', backgroundColor: Colors.black ),
          BottomNavigationBarItem( icon: Icon(Icons.calendar_month) ,label: '日期', backgroundColor: Colors.black),
          BottomNavigationBarItem( icon: Icon(Icons.settings),label: '設定' , backgroundColor: Colors.black),
          
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




