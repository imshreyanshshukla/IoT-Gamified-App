import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fb = FirebaseDatabase.instance;
  DatabaseReference? _ref;
  List<EventData> eventDataList = [];

  @override
  void initState() {
    super.initState();
    _ref = fb.reference().child('Events');
    _ref!.onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null && data is Map) {
        final dataList = data.entries
            .map((entry) => EventData.fromMap(entry.key, entry.value))
            .toList();
        setState(() {
          eventDataList = dataList;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Center(
          child: Text("IoT GAMIFIED",
        style: GoogleFonts.rubikPixels(
        fontSize: 45),
        ),
      ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: eventDataList.length,
              itemBuilder: (context, index) {
                final event = eventDataList[index];
                return EventTile(
                  day: event.day,
                  time: event.time,
                  eventName: event.eventName,
                );
              },
            ),
          ],
        ),
      ),
      );
  }
}

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/event_tile_pic2.jpg'),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 5.0, top: 25.0, bottom: 35),
          child: Text(
            "In this workshop participants will embark on a journey to create their very own fun and innovative multiplayer IoT gaming device! This hands-on workshop with kits provided is designed to introduce the basics of IoT technology including microcontrollers, sensors, protocols and more while encouraging further exploration in the domain. For enthusiasts, hobbyists, or just the curious soul, this workshop will be an unforgettable experience. ",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class EventTile extends StatelessWidget {
  final String day;
  final String time;
  final String eventName;

  EventTile({
    required this.day,
    required this.time,
    required this.eventName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0, bottom: 25.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Day: $day',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Time: $time',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              eventName,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventData {
  final String day;
  final String time;
  final String eventName;

  EventData({
    required this.day,
    required this.time,
    required this.eventName,
  });

  factory EventData.fromMap(String key, Map<dynamic, dynamic> value) {
    return EventData(
      day: value['day'] as String,
      time: value['time'] as String,
      eventName: value['eventName'] as String,
    );
  }
}