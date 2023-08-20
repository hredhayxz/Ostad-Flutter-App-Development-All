import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CricketLiveScoreApp());
}

class CricketLiveScoreApp extends StatelessWidget {
  const CricketLiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live score app'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('cricket')
              .doc('ban_vs_ind')
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
            print(snapshot.data?.data());
            final score = snapshot.data!;
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    score.get('match_name'),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            score.get('team_a_score').toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            score.get('team_a'),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const Text('vs'),
                      Column(
                        children: [
                          Text(
                            score.get('team_b_score').toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            score.get('team_b'),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('cricket')
              .doc('ban_vs_ind')
              .update({'match_name': "Bangladesh VS India", 'team_b_score': 7});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
