import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_flutter/social_media_flutter.dart';

class AboutPage extends StatefulWidget{
  const AboutPage({Key? key}) : super(key:key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("About Us"),
        ),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Image.asset('assets/images/logo.jpg')
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text("We, the Internet of Things Community or IoThinc are a student-run technical club at Vellore Institute of Technology, Vellore. We strive to teach students to acquire new skills in the rapidly evolving technology. The club's mission is to expose students to challenges and advancements in the field of IoT and thus to nurture and develop skillsets in this arena. We aim to increase awareness of the opportunities presented by IoT as a growing concept to provide a social platform for IoT enthusiasts to network and connect with experts within the field and to encourage students for the same. "),
          ),
          SizedBox(height: 400,),
          Container(
            height: 70,
            width: 300,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SocialWidget(
                    placeholderText: '',
                    iconData: SocialIconsFlutter.instagram,
                    iconColor: Colors.pink,
                    link: 'https://www.instagram.com/iothincvit/?hl=en',
                  ),
                  SizedBox(width: 10),
                  SocialWidget(
                    placeholderText: '',
                    iconData: SocialIconsFlutter.twitter,
                    iconColor: Colors.white,
                    link: 'https://www.instagram.com/imshreyanshshukla/',
                  ),
                  SizedBox(width: 10),
                  SocialWidget(
                    placeholderText: '',
                    iconData: SocialIconsFlutter.facebook,
                    iconColor: Colors.blue.shade700,
                    link: 'https://m.facebook.com/profile.php/?id=100069775172348',
                  ),
                  SizedBox(width: 10),
                  SocialWidget(
                    placeholderText: '',
                    iconData: SocialIconsFlutter.linkedin,
                    iconColor: Colors.blue,
                    link: 'https://www.linkedin.com/company/iothincvit?originalSubdomain=in',
                  ),
                ],
              ),
            ),
          ),
        ])
    );
  }
}