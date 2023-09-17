import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NoNotificationsPage extends StatefulWidget {
  const NoNotificationsPage({Key? key}) : super(key: key);

  @override
  _NoNotificationsPageState createState() => _NoNotificationsPageState();
}

class _NoNotificationsPageState extends State<NoNotificationsPage> {
  final fb = FirebaseDatabase.instance;
  DatabaseReference? _ref;
  List<NotificationData> notificationDataList = [];

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((_) {
      _ref = fb.reference().child('Notifications');
      _ref!.onValue.listen((event) {
        final data = event.snapshot.value;
        if (data != null && data is Map) {
          final dataList = data.entries
              .map((entry) => NotificationData.fromMap(entry.key, entry.value))
              .toList();
          setState(() {
            notificationDataList = dataList;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notificationDataList.length,
              itemBuilder: (context, index) {
                final notification = notificationDataList[index];
                return NotificationTile(
                  heading: notification.heading,
                  message: notification.message,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatefulWidget {
  final String heading;
  final String message;

  NotificationTile({required this.heading, required this.message});

  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0, right: 9.0, bottom: 25.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white10,
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Heading: ${widget.heading}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Message: ${widget.message}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            if (!isRead)
              TextButton(
                onPressed: () {
                  setState(() {
                    isRead = true;
                  });
                },
                child: Text(
                  'Mark as Read',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class NotificationData {
  final String heading;
  final String message;

  NotificationData({
    required this.heading,
    required this.message,
  });

  factory NotificationData.fromMap(String key, Map<dynamic, dynamic> value) {
    return NotificationData(
      heading: value['heading'] as String,
      message: value['message'] as String,
    );
  }
}