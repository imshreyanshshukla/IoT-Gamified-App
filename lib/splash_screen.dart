import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iothnicapp/main_page.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
    Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder:(_) => const MainPage()
      )
    );
    });
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/sps.jpg'),fit: BoxFit.fill),
        ),
      ),
    );
  }
}