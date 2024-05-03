import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LeaderboardView'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (ctx, i) => const ListTile(
          title: Text("Person's username"),
          subtitle: Text("Person's "),
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          trailing: Text("Points/100"),
        ),
        separatorBuilder: (ctx, i) => const Divider(),
      ),
    );
  }
}
