import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/posts/posts_screen.dart';
import 'package:frenxy/screens/posts/screens/choose_upload.dart';

class PostCameraBottomControlls extends StatelessWidget {
  final Function()? onRecordVideo;
  final VideoStatus status;
  const PostCameraBottomControlls({
    Key? key,
    this.status = VideoStatus.isInit,
    this.onRecordVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case VideoStatus.isRecording:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(),
                GestureDetector(
                  onTap: onRecordVideo,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: secondaryColor, width: 5),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.square,
                            color: secondaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(routeTransition(const MakePostScreen()));
                  },
                  icon: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.done_rounded,
                        size: 20,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      case VideoStatus.isPaused:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/post4.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    verticalSpace(),
                    const Text(
                      "Effects",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onRecordVideo,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: secondaryColor.withOpacity(0.4),
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(routeTransition(const MakePostScreen()));
                      },
                      icon: Icon(
                        Icons.backspace,
                        size: 30,
                        color: kWhiteColor,
                      ),
                    ),
                    horizontalSpace(),
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.done_rounded,
                            size: 20,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      default:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/post4.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    verticalSpace(),
                    const Text(
                      "Effects",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onRecordVideo,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: secondaryColor.withOpacity(0.4),
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(routeTransition(const PostsChooseUpload()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/bb.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      verticalSpace(),
                      const Text(
                        "Upload",
                        style: TextStyle(
                          fontSize: kSmallTextSize,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
    }
  }
}

enum VideoStatus { isRecording, isPaused, isInit }
