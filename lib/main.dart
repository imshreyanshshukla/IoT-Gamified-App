import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iothnicapp/firebase_api.dart';
import 'package:iothnicapp/firebase_options.dart';
import 'package:iothnicapp/main_page.dart';
import 'package:iothnicapp/no_notification.dart';
import 'package:iothnicapp/notification_page.dart';
import 'package:iothnicapp/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
       navigatorKey: navigatorKey,
       routes: {
         NotificationPage.route: (context) => const NotificationPage(),
       },
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
    );
  }
}