import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:module_14_assignment/ui/widgets/match_list_tile.dart';
import 'match_detail_screen.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Match List')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('football').snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('An error occurred.'));
          }
          final matches = snapshot.data!.docs;

          return ListView.separated(
            itemCount: matches.length,
            itemBuilder: (ctx, index) {
              final matchData = matches[index].data();
              return MatchListTile(
                matchName: matchData['match_name'],
                isMatchRunning: matchData['isMatchRunning'],
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => MatchDetailScreen(
                      matchDocumentId: matches[index].id,
                      matchName: matchData['match_name'],
                    ),
                  ));
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 2,
              );
            },
          );
        },
      ),
    );
  }
}
