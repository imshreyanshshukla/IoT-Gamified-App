import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu.dart';

class SpeakersPage extends StatefulWidget {
  const SpeakersPage({Key? key}) : super(key: key);

  @override
  State<SpeakersPage> createState() => _SpeakersPage();
}

class _SpeakersPage extends State<SpeakersPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        
        backgroundColor: Color(0xFF222831),
        drawer: MenuPage(),
        body:  SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Meet Our Speakers",
                textAlign: TextAlign.center,
                style: GoogleFonts.rubikPixels(
                  fontSize: 45,
                ),
              ),
            ),
            SizedBox(height: 60),
            Row(
              children: [
                SizedBox(width: 10,),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black45,
                    image: DecorationImage(
                      image: AssetImage("assets/images/aditya_patnaik.png")
                    )
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 100,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("Aditya Patnaik",
                      style: GoogleFonts.bebasNeue(fontSize: 20,color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white10
                  ),
                ),
              ],
            ),

            SizedBox(height: 70),

            Row(
              children: [
                SizedBox(width: 10,),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black45,
                      image: DecorationImage(
                          image: AssetImage("assets/images/arnav_jain.png")
                      )
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 100,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("Arnav Jain",
                      style: GoogleFonts.bebasNeue(fontSize: 20,color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10
                  ),
                ),
              ],
            ),

            SizedBox(height: 75,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white10,
                ),
              ),
            )
          ]),
        )
    );
  }
}