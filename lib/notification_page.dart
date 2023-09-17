import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:iothnicapp/main.dart';

class NotificationPage extends StatelessWidget{
  const NotificationPage({Key? key}) : super(key:key);
  static const route = '/notification-page';
  @override
  Widget build(BuildContext context){
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      backgroundColor: Color(0xFF222831),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Notifications"),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12)
              ),
                child: ListView(children: [
                  Text('${message.notification?.title}', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${message.notification?.body}',),
                ]
                )
            ),
          )
        ]
      )),
    );
  }
}