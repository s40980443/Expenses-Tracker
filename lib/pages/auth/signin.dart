//註冊

import 'package:flutter/material.dart';



//pages
import 'package:my_app4/pages/bottombar.dart';


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
    final isLogin = false;
  super.initState();
  }

  // @override
  // void dispose(){
  //   _emailController.dispose();
  //   _passwordController.dispose();
  // super.dispose();
  // }

  void login(email,password) async{
    try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: "skkfrc8159@gmail.com",
    password: "Ss40980443"
  );
  
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
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
                
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();
                login(email, password);
                
                User? user = FirebaseAuth.instance.currentUser;
                if(user!=null){
                  await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>BottomNavigationController()), (Route<dynamic> route) => false);

                  // await Navigator.push(context, 
                  //    MaterialPageRoute(
                  //     builder: (context) => 
                      
                  //     BottomNavigationController(),
                  //     ),
                  // );
                }




              },
              child: Text("Submit")
            ),



          ],
          
        ),
    )
    );
    
  }
  
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}