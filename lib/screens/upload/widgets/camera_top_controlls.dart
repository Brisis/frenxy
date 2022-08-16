import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/home_screen.dart';

class PostScreenTopControlls extends StatelessWidget {
  final Function()? onCameraFlipTap;
  final Function()? onCloseTap;
  final Function()? onFlashTap;
  final bool isFlashOn;
  const PostScreenTopControlls({
    Key? key,
    this.onCameraFlipTap,
    this.onCloseTap,
    this.onFlashTap,
    this.isFlashOn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onCloseTap,
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onCameraFlipTap,
              icon: Icon(
                Icons.flip_camera_android_outlined,
                color: kWhiteColor,
                size: 30,
              ),
            ),
            verticalSpace(height: 20),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onFlashTap,
              icon: Icon(
                isFlashOn ? Icons.flash_on : Icons.flash_off,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        )
      ],
    );
  }
}
