import 'package:flutter/material.dart';
import 'package:my_app4/pages/add.dart';
import 'package:my_app4/pages/analysis.dart';
import 'package:my_app4/pages/calendar.dart';
import 'package:my_app4/pages/pie.dart';

//auth
import 'package:my_app4/pages/auth/signup.dart';

//firebase
import 'package:firebase_auth/firebase_auth.dart';



class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingState();
}

class _SettingState extends State<Setting>{




  void logout() async{
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: ()async{
              logout();
              
              User? user = FirebaseAuth.instance.currentUser;
              if(user!=null){
                await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>SignUp()), (Route<dynamic> route) => false);
                // await Navigator.pushAndRemoveUntil(context, 
                //     MaterialPageRoute(
                //       builder: (context) => 
                //       // ProfilePage(user:user,),
                //       SignUp(),
                      
                //       )
                    
                //   );
                }
  

            }, 
            child: Text("logout")
          )
        ],
      )
    );
  }
}