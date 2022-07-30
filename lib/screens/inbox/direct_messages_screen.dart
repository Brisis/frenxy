import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/inbox/inbox_screen.dart';
import 'package:frenxy/screens/inbox/widgets/direct_message_tile.dart';

class InboxDirectMessages extends StatelessWidget {
  const InboxDirectMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(routeTransition(const InboxScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Center(
          child: Text(
            "Direct Messages",
            style: TextStyle(
              fontSize: kSubHeaderTextSize,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const InboxDirectMessageTileItem(
              username: "moyondizvo",
              image: "assets/images/bros.png",
            ),
            verticalSpace(height: 20),
            const InboxDirectMessageTileItem(
              username: "benevolentmudzinganyama",
              image: "assets/images/ben.jpeg",
            ),
            verticalSpace(height: 20),
            const InboxDirectMessageTileItem(
              username: "murozvi",
            ),
            verticalSpace(height: 20),
            Divider(
              color: dividerColor,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
