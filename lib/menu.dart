import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iothnicapp/about_page.dart';
import 'package:iothnicapp/developers_page.dart';

class MenuPage extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Container(
        color: Colors.black54,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48),
            Text("IoT Gamified", style: GoogleFonts.rubikPixels(fontSize: 30), textAlign: TextAlign.center),
            SizedBox(height: 20),
            buildMenuItem(
              text: 'The Developers Team',
              icon: Icons.people_alt_outlined,
              onClicked: () => selectedItem(context,0),
            ),
            buildMenuItem(
              text: 'About Us',
              icon: Icons.info_outline,
              onClicked: () => selectedItem(context,1),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(onPressed: (){
                FirebaseAuth.instance.signOut();
              },
                color: Colors.yellow.shade800,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Sign Out"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white;

    return ListTile(
      leading : Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,

    );
  }

  void selectedItem(BuildContext context, int index){
    switch(index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
            builder:(context) => DevelopersPage()));

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder:(context) => AboutPage()));

    }
  }
}