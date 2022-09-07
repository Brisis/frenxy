import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/profile/user_profile_screen.dart';

class FollowAccountImage extends StatelessWidget {
  const FollowAccountImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              routeTransition(
                const UserProfileScreen(),
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                image: AssetImage("assets/images/girl3.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        verticalSpace(
          height: 60,
        ),
        Positioned(
          bottom: 0,
          left: 15,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
