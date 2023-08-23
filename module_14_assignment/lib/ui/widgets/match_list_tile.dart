import 'package:flutter/material.dart';
import 'package:module_14_assignment/ui/utility/assets_utils.dart';

class MatchListTile extends StatelessWidget {
  final String matchName;
  final bool? isMatchRunning; // Change to bool? here
  final VoidCallback onClick;

  const MatchListTile(
      {Key? key, required this.matchName, this.isMatchRunning, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(AssetsUtils.football),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            matchName,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      subtitle: Chip(
        label: Text(
          isMatchRunning == true ? 'Running' : 'Finished',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: isMatchRunning == true ? Colors.green : Colors.red,
      ),
      trailing: const Icon(
        Icons.arrow_right_alt_rounded,
        color: Colors.white,
      ),
      tileColor: Colors.deepPurple,
      onTap: onClick,
    );
  }
}
