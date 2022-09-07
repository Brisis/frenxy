import 'package:flutter/material.dart';
import 'package:frenxy/screens/posts/post_item.dart';
import 'package:frenxy/screens/posts/upload_choose_post_item.dart';
import 'package:frenxy/widgets/single_post.dart';
import 'package:page_transition/page_transition.dart';

const double kExtraSmallTextSize = 10.0;
const double kSmallTextSize = 11.0;
const double kNormalTextSize = 12.0;
const double kSubHeaderTextSize = 13.0;
const double kHeaderTextSize = 15.0;

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

Color primaryColor = Colors.black;
Color secondaryColor = Colors.red;
Color dividerColor = Colors.grey.shade300;
Color kTextGreyColor = Colors.black54;
Color kWhiteColor = Colors.white;

List<SinglePost> posts = const [
  SinglePost(
    username: "frenxy",
    postVideo: "assets/video/vid1.mp4",
  ),
  SinglePost(
    username: "ben",
    postVideo: "assets/video/vid2.mp4",
  ),
  SinglePost(
    username: "esykomichi",
    postVideo: "assets/video/vid3.mp4",
  ),
  // SinglePost(
  //   username: "advocate",
  //   postVideo: "assets/video/vid4.mp4",
  // ),
  // SinglePost(
  //   username: "tiktok",
  //   postVideo: "assets/video/vid5.mp4",
  // ),
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

List<PostsChooseUploadItem> choosePosts = [
  PostsChooseUploadItem(
    postImage: "assets/images/post1.webp",
    onTap: () {},
  ),
  PostsChooseUploadItem(
    postImage: "assets/images/post2.jpeg",
    onTap: () {},
  ),
  PostsChooseUploadItem(
    postImage: "assets/images/post3.webp",
    onTap: () {},
  ),
  PostsChooseUploadItem(
    postImage: "assets/images/post4.jpeg",
    onTap: () {},
  ),
  PostsChooseUploadItem(
    postImage: "assets/images/post5.jpeg",
    onTap: () {},
  ),
  PostsChooseUploadItem(
    postImage: "assets/images/post6.jpeg",
    onTap: () {},
  ),
  PostsChooseUploadItem(
    postImage: "assets/images/post7.jpeg",
    onTap: () {},
  ),
  PostsChooseUploadItem(
    postImage: "assets/images/post8.jpeg",
    onTap: () {},
  ),
  PostsChooseUploadItem(
    postImage: "assets/images/post9.jpeg",
    onTap: () {},
  ),
];
