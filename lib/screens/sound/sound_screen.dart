import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/home_screen.dart';
import 'package:frenxy/screens/posts/posts.dart';
import 'package:frenxy/widgets/custom_outlined_button.dart';

class SoundScreen extends StatelessWidget {
  const SoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        // title: const Center(
        //   child: Text(
        //     "Frenxy",
        //     style: TextStyle(
        //       fontSize: kSubHeaderTextSize,
        //       color: Colors.black,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: const Icon(
                Icons.reply,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/girl1.jpeg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 48,
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                horizontalSpace(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "The Round",
                      style: TextStyle(
                        fontSize: kSubHeaderTextSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalSpace(),
                    Text(
                      "Roddy Richy",
                      style: TextStyle(
                        fontSize: kNormalTextSize,
                        color: kTextGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalSpace(),
                    Text(
                      "1.7M videos",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: kTextGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalSpace(height: 10),
                    CustomOutlinedButton(
                      padding: 5,
                      onPressed: () {},
                      title: "Add to Favourites",
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(height: 20),
          const ProfilePosts(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: secondaryColor,
        icon: Icon(Icons.video_camera_back, color: Colors.white),
        label: Text('Use this sound'),
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(20.0))),
        // onPressed: () {},
        // child: Row(
        //   children: [
        //     Icon(
        //       Icons.video_camera_back,
        //       color: Colors.white,
        //     ),
        //     horizontalSpace(width: 5),
        //     const Text(
        //       "Use this sound",
        //       style: TextStyle(
        //         fontSize: kNormalTextSize,
        //         color: Colors.white,
        //         fontWeight: FontWeight.w500,
        //       ),
        //     ),
        //   ],
        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
