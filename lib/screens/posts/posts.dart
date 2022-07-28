import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/posts/post_item.dart';

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Text(
        //   "Timeline",
        //   style: TextStyle(
        //     fontSize: 13,
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // verticalSpace(height: 10),
        Row(
          children: [
            Expanded(
              child: PostItem(),
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: PostItem(),
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: PostItem(),
            ),
          ],
        ),
        verticalSpace(height: 1),
        Row(
          children: [
            Expanded(
              child: PostItem(),
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: PostItem(),
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: PostItem(),
            ),
          ],
        ),
      ],
    );
  }
}
