import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/home_screen.dart';

class PostScreenTopControlls extends StatelessWidget {
  final Function()? onCameraFlipTap;
  final Function()? onFiltersTap;
  final Function()? onFlashTap;
  final Function()? onSoundsTap;
  final bool isFlashOn;
  const PostScreenTopControlls({
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(routeTransition(const HomeScreen()));
                },
                icon: Icon(
                  Icons.close,
                  color: kWhiteColor,
                ),
              ),
              horizontalSpace(width: 20),
              Row(
                children: [
                  Icon(
                    Icons.music_note,
                    color: kWhiteColor,
                    size: 15,
                  ),
                  horizontalSpace(),
                  Text(
                    "Sounds",
                    style: TextStyle(
                      fontSize: kSubHeaderTextSize,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        horizontalSpace(width: 100),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onCameraFlipTap,
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.flip_camera_android_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Flip",
                    style: TextStyle(
                      fontSize: kSmallTextSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(height: 20),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: const [
            //     Icon(
            //       Icons.speed,
            //       color: Colors.white,
            //       size: 30,
            //     ),
            //     SizedBox(
            //       height: 8,
            //     ),
            //     Text(
            //       "Speed",
            //       style: TextStyle(
            //         fontSize: kSmallTextSize,
            //         color: Colors.white,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: const [
            //     Icon(
            //       Icons.auto_awesome,
            //       color: Colors.white,
            //       size: 30,
            //     ),
            //     SizedBox(
            //       height: 8,
            //     ),
            //     Text(
            //       "Beauty",
            //       style: TextStyle(
            //         fontSize: kSmallTextSize,
            //         color: Colors.white,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onFiltersTap,
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.join_inner,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: kSmallTextSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(height: 20),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: const [
            //     Icon(
            //       CupertinoIcons.timer,
            //       color: Colors.white,
            //       size: 30,
            //     ),
            //     SizedBox(
            //       height: 8,
            //     ),
            //     Text(
            //       "Timer",
            //       style: TextStyle(
            //         fontSize: kSmallTextSize,
            //         color: Colors.white,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onFlashTap,
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    //Icons.flash_on,
                    isFlashOn ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                    size: 20,
                  ),
                  verticalSpace(),
                  const Text(
                    "Flash",
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
