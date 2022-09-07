import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/home_screen.dart';
import 'package:frenxy/screens/posts/posts.dart';
import 'package:frenxy/widgets/profile_detail.section.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(routeTransition(const HomeScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Center(
          child: Text(
            "Frenxy",
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
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const ProfileDetailSection(
            username: "frenxy",
            bio: "Model & Influencer",
            image: "assets/images/girl1.jpeg",
            following: 12,
            followers: 324,
            likes: 890,
            isMe: false,
          ),
          const ProfilePosts(),
          verticalSpace(),
        ],
      ),
    );
  }
}
