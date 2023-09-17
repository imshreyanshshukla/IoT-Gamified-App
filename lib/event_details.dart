import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final fb = FirebaseDatabase.instance;
  DatabaseReference? _ref;

  @override
  void initState() {
    super.initState();
    _ref = fb.reference().child('Events');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          HeaderWidget(),
          Expanded(
            child: FirebaseAnimatedList(
              query: _ref!,
              itemBuilder: (context, snapshot, animation, index) {
                final key = snapshot.key;
                final value = snapshot.value as Map<dynamic, dynamic>;
                final day = value['day'];
                final time = value['time'];
                final eventName = value['eventName'];

                return EventTile(
                  day: day,
                  time: time,
                  eventName: eventName,
                );
              },
            ),
          ),
        ],
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
            "Random description yeet ",
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