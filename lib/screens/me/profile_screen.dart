import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/home_screen.dart';
import 'package:frenxy/screens/posts/posts.dart';
import 'package:frenxy/screens/settings/settings_screen.dart';
import 'package:frenxy/widgets/bottom_navbar_light.dart';
import 'package:frenxy/widgets/profile_detail.section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            "Benevolent Mudzinganyama",
            style: TextStyle(
              fontSize: kSubHeaderTextSize,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(routeTransition(const SettingsScreen()));
            },
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
            username: "benevolentmudzinganyama",
            bio: "Tech Serial Entreprenuer",
            image: "assets/images/ben.jpeg",
            following: 455,
            followers: 1098,
            likes: 5004,
          ),
          const ProfilePosts(),
          verticalSpace(),
        ],
      ),
      bottomNavigationBar: const BottomNavbarLight(
        backgroundColor: Colors.white,
        currentIndex: 3,
      ),
    );
  }
}
