import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/widgets/custom_button.dart';
import 'package:frenxy/widgets/custom_outlined_button.dart';

class ProfileDetailSection extends StatelessWidget {
  final String image;
  final String username;
  final String bio;
  final int following;
  final int followers;
  final int likes;
  final bool isMe;

  const ProfileDetailSection({
    Key? key,
    required this.username,
    required this.bio,
    required this.image,
    required this.following,
    required this.followers,
    required this.likes,
    this.isMe = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 50,
            ),
            verticalSpace(),
            Text(
              "@$username",
              style: const TextStyle(
                fontSize: kHeaderTextSize,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            verticalSpace(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "$following",
                      style: const TextStyle(
                        fontSize: kSubHeaderTextSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Following",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                horizontalSpace(width: 30),
                Column(
                  children: [
                    Text(
                      "$followers",
                      style: const TextStyle(
                        fontSize: kSubHeaderTextSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Followers",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                horizontalSpace(width: 30),
                Column(
                  children: [
                    Text(
                      "$likes",
                      style: const TextStyle(
                        fontSize: kSubHeaderTextSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Likes",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: isMe
                        ? CustomOutlinedButton(
                            onPressed: () {},
                            title: "Edit profile",
                          )
                        : CustomButton(
                            onPressed: () {},
                            title: "Follow",
                          ),
                  ),
                ],
              ),
            ),
            verticalSpace(height: 10),
            Text(
              bio,
              style: const TextStyle(
                fontSize: kNormalTextSize,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
