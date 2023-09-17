import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class LeaderboardManager {
  final DatabaseReference _ref =
  FirebaseDatabase.instance.reference().child('Leaderboard');

  Stream<List<Map<dynamic, dynamic>>> getLeaderboardStream() {
    return _ref.orderByChild('score').onValue.map((event) {
      final topLeaders = <Map<dynamic, dynamic>>[];

      if (event.snapshot.value != null) {
        final Map<dynamic, dynamic> data =
        event.snapshot.value as Map<dynamic, dynamic>;

        final List<MapEntry<dynamic, dynamic>> entries = data.entries.toList();

        entries.sort((a, b) {
          final int scoreA = a.value['score'];
          final int scoreB = b.value['score'];
          return scoreB.compareTo(scoreA);
        });

        entries.forEach((entry) {
          topLeaders.add({
            'rank': topLeaders.length + 1,
            'name': entry.value['name'],
            'score': entry.value['score'],
          });
        });
      }

      return topLeaders;
    });
  }

  Stream<List<Map<dynamic, dynamic>>> getRemainingPlayersStream() {
    return _ref.orderByChild('score').limitToFirst(3).onValue.map((event) {
      final topLeaders = <Map<dynamic, dynamic>>[];

      if (event.snapshot.value != null) {
        final Map<dynamic, dynamic> data =
        event.snapshot.value as Map<dynamic, dynamic>;

        final List<MapEntry<dynamic, dynamic>> entries = data.entries.toList();

        entries.sort((a, b) {
          final int scoreA = a.value['score'];
          final int scoreB = b.value['score'];
          return scoreB.compareTo(scoreA);
        });

        entries.skip(3).forEach((entry) {
          topLeaders.add({
            'rank': topLeaders.length + 1,
            'name': entry.value['name'],
            'score': entry.value['score'],
          });
        });
      }

      return topLeaders;
    });
  }
}

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final LeaderboardManager _leaderboardManager = LeaderboardManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<List<Map<dynamic, dynamic>>>(
        stream: _leaderboardManager.getLeaderboardStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final leaderboardData = snapshot.data!;
            // Separate the top 3 entries
            final List<Map<dynamic, dynamic>> top3 =
            leaderboardData.take(3).toList();

            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (top3.length > 1)
                        WinnerContainer(
                          isFirst: false,
                          color: Colors.transparent,
                          winnerPosition: '',
                          rank: '2',
                          winnerName: top3[1]['name'],
                          height: 150,
                          score: top3[1]['score'].toString(),
                        ),
                      if (top3.isNotEmpty)
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            WinnerContainer(
                              isFirst: true,
                              color: Colors.transparent,
                              winnerPosition: '',
                              rank: '1',
                              winnerName: top3[0]['name'],
                              height: 180,
                              score: top3[0]['score'].toString(),
                            ),
                          ],
                        ),
                      if (top3.length > 2)
                        WinnerContainer(
                          isFirst: false,
                          color: Colors.transparent,
                          winnerPosition: '',
                          rank: '3',
                          height: 120,
                          winnerName: top3[2]['name'],
                          score: top3[2]['score'].toString(),
                        ),
                    ],
                  ),
                ),
                ...leaderboardData.skip(3).map((entry) {
                  final rank = entry['rank'];
                  final name = entry['name'];
                  final score = entry['score'];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.white10,
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '$rank',
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '$name',
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '$score',
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                  10), // Add spacing between name and score
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}

class WinnerContainer extends StatelessWidget {
  final bool isFirst;
  final Color color;
  final String winnerPosition;
  final String winnerName;
  final String rank;
  final double height;
  final String score; // Add a score parameter

  const WinnerContainer(
      {Key? key,
        required this.isFirst,
        required this.color,
        required this.winnerPosition,
        required this.winnerName,
        required this.rank,
        required this.height,
        required this.score}) // Define the score parameter
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Center(
              child: Container(
                height: height,
                width: 100,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                if (isFirst)
                  Image.asset("assets/images/crown.png",
                      height: 60, width: 100),
                Padding(
                  padding: const EdgeInsets.only(top: 110.0, left: 40),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(rank,
                          style: GoogleFonts.bebasNeue(color: Colors.black)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 150),
                  child: Column(
                    children: [
                      Text(
                        winnerName,
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        score, // Display the score
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
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