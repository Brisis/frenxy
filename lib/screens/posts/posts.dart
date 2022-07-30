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
        SizedBox(
          height: 150,
          child: Row(
            children: [
              Expanded(
                child: discoverPosts[0],
              ),
              horizontalSpace(width: 1),
              Expanded(
                child: discoverPosts[1],
              ),
              horizontalSpace(width: 1),
              Expanded(
                child: discoverPosts[2],
              ),
            ],
          ),
        ),
        verticalSpace(height: 1),
        SizedBox(
          height: 150,
          child: Row(
            children: [
              Expanded(
                child: discoverPosts[3],
              ),
              horizontalSpace(width: 1),
              Expanded(
                child: discoverPosts[4],
              ),
              horizontalSpace(width: 1),
              Expanded(
                child: discoverPosts[5],
              ),
            ],
          ),
        ),
        verticalSpace(height: 1),
        SizedBox(
          height: 150,
          child: Row(
            children: [
              Expanded(
                child: discoverPosts[6],
              ),
              horizontalSpace(width: 1),
              Expanded(
                child: discoverPosts[7],
              ),
              horizontalSpace(width: 1),
              Expanded(
                child: discoverPosts[8],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
