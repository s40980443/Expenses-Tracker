//註冊

import 'package:flutter/material.dart';


//firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app4/pages/auth/signup.dart';
import 'package:my_app4/pages/auth/profile.dart';
import 'package:my_app4/main.dart';



class Signin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SigninState();
}

class _SigninState extends State<Signin> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  @override
  void initState(){
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    late final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final _focusName = FocusNode();
    final _focusEmail = FocusNode();
    final _focusPassword = FocusNode();
  super.initState();
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
  super.dispose();
  }



  void createUser(email,password) async{
    try{
      //create User
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:email,
        password: password
        );
      print("Email : ${email}");
      print("Password : ${password}");
      
    }on FirebaseAuthException catch(e){
      //密碼太短
      if (e.code == "weak-password") {
        print('The password provided is too weak.');
      //Email已經使用
      } else if (e.code == "email-already-in-use") {
        print('An account already exists for that email.');
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child:TextField(
                controller: _passwordController,
                //隱碼
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Passowrd",
                ),
              ),
            ),
            
            ElevatedButton(
              onPressed: () async {
                

                User? user = FirebaseAuth.instance.currentUser;
                if(user!=null){
                  Navigator.pushAndRemoveUntil(context, 
                    MaterialPageRoute(
                      builder: (context) => 
                      ProfilePage(user:user,),
                      // BottomNavigationController(),
                      ),
                      (route) => false
                  );
                }
              },
              child: Text("Submit")
            ),



          ],
          
        ),
    )
    );
  }
}