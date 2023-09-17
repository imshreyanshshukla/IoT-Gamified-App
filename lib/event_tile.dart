
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Event extends StatelessWidget{
  const Event({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.only(left: 9.0, bottom:25.0),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/event_tile_pic2.jpg'),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 5.0,top: 35.0,bottom: 35),
              child: Text("In this workshop participants will embark on a journey to create their very own fun and innovative multiplayer IoT gaming device! This hands-on workshop with kits provided is designed to introduce the basics of IoT technology including microcontrollers, sensors, protocols and more while encouraging further exploration in the domain. For enthusiasts, hobbyists, or just the curious soul, this workshop will be an unforgettable experience. ",
                  style: GoogleFonts.inter( fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}

