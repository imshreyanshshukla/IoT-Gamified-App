import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget{
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final _emailController = TextEditingController();
  final _ingamenameController = TextEditingController();
  final _registrationnumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _ingamenameController.dispose();
    _registrationnumberController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if (passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      addUserDetails(
        _ingamenameController.text.trim(),
        _registrationnumberController.text.trim()
      );
    }
  }

  Future addUserDetails(String ingameName, String registrationNumber) async{
    await FirebaseFirestore.instance.collection('users').add({
      "In Game Name": ingameName,
      "Registration Number": registrationNumber,
    });
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim() ==
       _confirmpasswordController.text.trim()){
      return true;
    } else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.jpg"),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                SizedBox(height: 25),
                
                Text("Hello There!",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                Text("IoThinc VIT Welcomes You!",
                  style: TextStyle(fontSize: 20),),

                SizedBox(height: 30),

                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.white10,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _registrationnumberController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Registration Number',
                    fillColor: Colors.white10,
                    filled: true,
                  ),
                ),
                ),

                SizedBox(height: 10),

                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _ingamenameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'In Game Name',
                      fillColor: Colors.white10,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.white10,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _confirmpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Confirm Password',
                      fillColor: Colors.white10,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 25,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade800,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member?",style: TextStyle(fontWeight: FontWeight.bold),),
                    GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          " Login Now",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}