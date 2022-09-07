

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
      appBar:  AppBar(backgroundColor: Colors.white,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                color: Colors.red,
                height: 80.0,
                width: 80.0,
              ),
              horizontalSpace(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const Text(
                    "The Round",
                    style: TextStyle(
                      fontSize: kHeaderTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  
                  ),
                  verticalSpace(),
const Text(
                    "Roddy Richy",
                    style: TextStyle(
                      fontSize: kHeaderTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  
                  ),
                  const Text(
                    "1.7M videos",
                    style: TextStyle(
                      fontSize: kHeaderTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),

                    
                  
                  ),
                  CustomOutlinedButton(title: "Add to Favourites",),
                ],
              ),
            ],
          ),
          verticalSpace(height: 20),
          const ProfilePosts(),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    "Loading",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  horizontalSpace(),
                  const SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.video_camera_back, color: Colors.white,),
              horizontalSpace(width: 5),
              const Text(
                    "Use this sound",
                    style: TextStyle(
                      fontSize: kHeaderTextSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                
                  ),
            ],
          ),
        ),
      ),
    );
  }
}