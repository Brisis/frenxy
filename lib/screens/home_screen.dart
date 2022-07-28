import 'package:flutter/material.dart';
import 'package:frenxy/helpers/tiktok_scroll.dart';
import 'package:frenxy/widgets/bottom_navbar.dart';
import 'package:frenxy/widgets/single_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SinglePost> posts = const [
    SinglePost(
      username: "frenxy",
      postImage: "assets/images/girl1.jpeg",
    ),
    SinglePost(
      username: "ben",
      postImage: "assets/images/girl4.jpeg",
    ),
    SinglePost(
      username: "esykomichi",
      postImage: "assets/images/esy.jpg",
    ),
    SinglePost(
      username: "advocate",
      postImage: "assets/images/car.webp",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Controller controller = Controller()
      ..addListener((event) {
        _handleCallbackEvent(event.direction, event.success);
      });
    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      body: TikTokStyleFullPageScroller(
        contentSize: posts.length,
        swipePositionThreshold: 0.2,
        // ^ the fraction of the screen needed to scroll
        swipeVelocityThreshold: 2000,
        // ^ the velocity threshold for smaller scrolls
        animationDuration: const Duration(milliseconds: 400),
        // ^ how long the animation will take
        controller: controller,
        // ^ registering our own function to listen to page changes
        builder: (BuildContext context, int index) {
          return posts[index];
        },
      ),
    );
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success, {int? currentIndex}) {
    //print("Scroll callback received with data: {direction: $direction, success: $success and index: ${currentIndex ?? 'not given'}}");
  }
}
