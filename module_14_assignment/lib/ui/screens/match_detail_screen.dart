import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchDetailScreen extends StatelessWidget {
  final String matchDocumentId, matchName;

  const MatchDetailScreen(
      {super.key, required this.matchDocumentId, required this.matchName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(matchName)),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('football')
            .doc(matchDocumentId)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('An error occurred.'));
          }

          final matchData = snapshot.data!.data() as Map<String, dynamic>;

          return Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  '${matchData['match_name']}',
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${matchData['team_a_goal_count']} : ${matchData['team_b_goal_count']}',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Time: ${matchData['running_time']}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total Time: ${matchData['total_time']}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
