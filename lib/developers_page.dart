import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevelopersPage extends StatefulWidget{
  const DevelopersPage({Key? key}) : super(key:key);

  @override
  State<DevelopersPage> createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF222831),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("The Team"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black45,
                        image: DecorationImage(
                            image: AssetImage("assets/images/aakash_mittal-removebg-preview.png")
                        )
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 100,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          Text("Aakash Mittal",
                          style: GoogleFonts.bebasNeue(
                              fontSize: 20,
                              color: Colors.white
                          ),
                          ),
                          SizedBox(height: 10,),
                          Text("BTech. 2nd Year | CSE CORE"),
                          SizedBox(height: 3,),
                          Text('Backend Developer')
                      ]),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black45,
                        image: DecorationImage(
                            image: AssetImage("assets/images/shreyansh_shukla-removebg-preview.png")
                        )
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 100,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [Text("Shreyansh Shukla",
                          style: GoogleFonts.bebasNeue(fontSize: 20,color: Colors.white),),
                          SizedBox(height: 10,),
                          Text("BTech. 2nd Year | CSE CORE"),
                          SizedBox(height: 3,),
                          Text('Frontend Developer')
                      ]),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

    );
  }
}