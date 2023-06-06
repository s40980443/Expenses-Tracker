//註冊

import 'package:flutter/material.dart';


//firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app4/pages/auth/signin.dart';





class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


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
        password: password,
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
      appBar: AppBar(title: Text("Sign Up"),),
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
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Passowrd",
                ),
              ),
            ),
            
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();
                createUser(email,password);
                
              },
              child: Text("Submit")
            ),


            TextButton(onPressed: () async{
                await FirebaseAuth.instance.signOut();
              }, child: Text("Logout")),
            
            //Sign in
            TextButton(onPressed: () {
              
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => Signin()),
              );
            },
            child: Text("Sign in"),
            )

            
          ],

          
          
        ),
    )
    );
  }
}