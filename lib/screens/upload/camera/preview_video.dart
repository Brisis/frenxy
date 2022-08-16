import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/upload/file_chooser/upload_post.dart';
import 'package:frenxy/screens/upload/widgets/preview_top_section.dart';
import 'package:frenxy/widgets/custom_button.dart';
import 'package:video_player/video_player.dart';

class CameraPreviewScreen extends StatefulWidget {
  final String filePath;
  const CameraPreviewScreen({
    Key? key,
    required this.filePath,
  }) : super(key: key);

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 1.0,
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: _initVideoPlayer(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                /// Ensures the camera preview covers the screen
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: Colors.blueGrey,
                    child: VideoPlayer(_videoPlayerController),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
                  child: IconButton(
                    onPressed: () {
                      _videoPlayerController.dispose();
                      Navigator.of(context).pop();
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
                          Icons.close,
                          size: 20,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          // border: Border(
          //   top: BorderSide(color: dividerColor, width: 0.5),
          // ),
          color: primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.music_note,
                      color: kWhiteColor,
                      size: 25,
                    ),
                    verticalSpace(height: 3),
                    Text(
                      "Sounds",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpace(width: 20),
            Expanded(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.auto_fix_high,
                      color: kWhiteColor,
                      size: 25,
                    ),
                    verticalSpace(height: 3),
                    Text(
                      "Effects",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpace(width: 20),
            Expanded(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.text_format,
                      color: kWhiteColor,
                      size: 25,
                    ),
                    verticalSpace(height: 3),
                    Text(
                      "Text",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpace(width: 50),
            CustomButton(
              onPressed: () {
                Navigator.of(context).push(routeTransition(PostsSubmitUpload(filePath: widget.filePath)));
              },
              title: "Next",
              color: secondaryColor,
              padding: 5,
              fontSize: kSmallTextSize,
              textColor: kWhiteColor,
            )
          ],
        ),
      ),
    );
  }
}
