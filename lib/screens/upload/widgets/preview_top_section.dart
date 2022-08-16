import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/home_screen.dart';

class CameraPreviewTopSection extends StatelessWidget {
  final Function()? onCameraFlipTap;
  final Function()? onFiltersTap;
  final Function()? onFlashTap;
  final Function()? onSoundsTap;
  final bool isFlashOn;
  const CameraPreviewTopSection({
    Key? key,
    this.onCameraFlipTap,
    this.onFiltersTap,
    this.onFlashTap,
    this.onSoundsTap,
    this.isFlashOn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(routeTransition(const HomeScreen()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: kWhiteColor,
            size: 25,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(height: 15),
            GestureDetector(
              onTap: onFiltersTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.join_inner,
                    color: kWhiteColor,
                    size: 20,
                  ),
                  verticalSpace(height: 10),
                  Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: kSmallTextSize,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(height: 30),
            GestureDetector(
              onTap: onCameraFlipTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.voicemail,
                    color: kWhiteColor,
                    size: 20,
                  ),
                  verticalSpace(height: 10),
                  Text(
                    "Voice Effects",
                    style: TextStyle(
                      fontSize: kSmallTextSize,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(height: 30),
            GestureDetector(
              onTap: onFlashTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.voice_chat,
                    color: kWhiteColor,
                    size: 20,
                  ),
                  verticalSpace(height: 10),
                  const Text(
                    "Voiceover",
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
        )
      ],
    );
  }
}
