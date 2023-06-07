

import 'package:flutter/material.dart';

//pages
import 'package:my_app4/pages/add.dart';
import 'package:my_app4/pages/analysis.dart';
import 'package:my_app4/pages/calendar.dart';
import 'package:my_app4/pages/pie.dart';
import 'package:my_app4/pages/setting.dart';
import 'package:my_app4/pages/bottombar.dart';

//auth 
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









