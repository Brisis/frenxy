import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';

class PostItem extends StatelessWidget {
  final String postImage;
  final int postLikes;
  final Function()? onTap;
  const PostItem({
    Key? key,
    required this.postImage,
    required this.postLikes,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage(postImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.white,
                    size: 15,
                  ),
                  horizontalSpace(),
                  Text(
                    "$postLikes",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
