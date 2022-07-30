import 'package:flutter/material.dart';
import 'package:frenxy/screens/posts/post_item.dart';
import 'package:frenxy/widgets/single_post.dart';
import 'package:page_transition/page_transition.dart';

SizedBox verticalSpace({double height = 8.0}) {
  return SizedBox(height: height);
}

SizedBox horizontalSpace({double width = 8.0}) {
  return SizedBox(width: width);
}

PageTransition routeTransition(Widget screen) {
  return PageTransition(
    child: screen,
    type: PageTransitionType.fade,
    duration: const Duration(),
  );
}

const double kBottomNavigationPadding = 5;

Color dividerColor = Colors.grey.shade300;
Color kTextGreyColor = Colors.black54;

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

List<PostItem> discoverPosts = [
  PostItem(
    postImage: "assets/images/post1.webp",
    postLikes: 210,
    onTap: () {},
  ),
  PostItem(
    postImage: "assets/images/post2.jpeg",
    postLikes: 89,
    onTap: () {},
  ),
  PostItem(
    postImage: "assets/images/post3.webp",
    postLikes: 34,
    onTap: () {},
  ),
  PostItem(
    postImage: "assets/images/post4.jpeg",
    postLikes: 983,
    onTap: () {},
  ),
  PostItem(
    postImage: "assets/images/post5.jpeg",
    postLikes: 77,
    onTap: () {},
  ),
  PostItem(
    postImage: "assets/images/post6.jpeg",
    postLikes: 100,
    onTap: () {},
  ),
  PostItem(
    postImage: "assets/images/post7.jpeg",
    postLikes: 1003,
    onTap: () {},
  ),
  PostItem(
    postImage: "assets/images/post8.jpeg",
    postLikes: 344,
    onTap: () {},
  ),
  PostItem(
    postImage: "assets/images/post9.jpeg",
    postLikes: 430,
    onTap: () {},
  ),
];
