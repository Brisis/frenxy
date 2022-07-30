import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/inbox/components/inbox_all_activity.dart';
import 'package:frenxy/screens/inbox/components/inbox_comments.dart';
import 'package:frenxy/screens/inbox/components/inbox_followers.dart';
import 'package:frenxy/screens/inbox/components/inbox_likes.dart';
import 'package:frenxy/screens/inbox/components/inbox_mentions.dart';
import 'package:frenxy/screens/inbox/direct_messages_screen.dart';

import 'package:frenxy/widgets/bottom_navbar_light.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  // Initial Selected Value
  String dropdownvalue = 'All activity';

  // List of items in our dropdown menu
  var items = [
    'All activity',
    'Likes',
    'Comments',
    'Mentions',
    'Followers',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // The actions area here
        elevation: 0.5,
        title: SizedBox(
          width: double.infinity,
          height: 40,
          child: Center(
            child: DropdownButton(
              value: dropdownvalue,
              iconSize: 30,
              iconEnabledColor: primaryColor,
              //icon: const Icon(Icons.keyboard_arrow_down),
              underline: const SizedBox.shrink(),
              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: kHeaderTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(routeTransition(const InboxDirectMessages()));
            },
            icon: Icon(
              Icons.email_outlined,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: getCurrentComponent(),
      ),
      bottomNavigationBar: const BottomNavbarLight(
        backgroundColor: Colors.white,
        currentIndex: 2,
      ),
    );
  }

  Widget getCurrentComponent() {
    switch (dropdownvalue) {
      case "All activity":
        return const InboxAllActivityComponent();
      case "Likes":
        return const InboxLikesComponent();
      case "Comments":
        return const InboxCommentsComponent();
      case "Mentions":
        return const InboxMentionsComponent();
      case "Followers":
        return const InboxFollowersComponent();
      default:
        return const InboxAllActivityComponent();
    }
  }
}

enum CurrentDropItem {
  allactivity,
  likes,
  comments,
  mentions,
  followers,
}
