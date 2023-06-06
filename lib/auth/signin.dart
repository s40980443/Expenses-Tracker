

//登入


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Signin extends StatefulWidget{
  @override
  _SigninState createState () => _SigninState();
  
}
class _SigninState extends State<Signin>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.0,
          title: const Text('Sign in to Lumei Digital'),        
        ),
        body:Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: ElevatedButton(                                
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                  // dynamic result = await_authService.signInAnonymously();
                  }),
        )
      );
  }
}