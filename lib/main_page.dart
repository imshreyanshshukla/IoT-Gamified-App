import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iothnicapp/start_page.dart';

import 'auth_page.dart';

class MainPage extends StatelessWidget{
  const MainPage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
             return StartPage();
          }else{
            return AuthPage();
          }
        },
      ),
    );
  }
}