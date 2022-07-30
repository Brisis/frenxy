import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/home_screen.dart';
import 'package:frenxy/screens/posts/screens/upload_post.dart';
import 'package:frenxy/widgets/custom_button.dart';

class PostsChooseUpload extends StatelessWidget {
  const PostsChooseUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(routeTransition(const HomeScreen()));
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Choose file",
            style: TextStyle(
              fontSize: kSubHeaderTextSize,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: primaryColor,
                unselectedLabelColor: Colors.black54,
                indicatorColor: primaryColor,
                tabs: const [
                  Tab(
                    text: "Video",
                  ),
                  Tab(
                    text: "Image",
                  ),
                ],
              ),
              verticalSpace(height: 30),
              const Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  dragStartBehavior: DragStartBehavior.down,
                  children: [
                    ChooseVideoUpload(),
                    ChooseImageUplad(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: dividerColor, width: 0.5),
            ),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "You can select both videos and photos",
                  style: TextStyle(
                    fontSize: kSmallTextSize,
                    color: kTextGreyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              horizontalSpace(width: 20),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).push(routeTransition(const PostsSubmitUpload()));
                },
                title: "Next",
                color: Colors.grey.shade200,
                padding: 5,
                fontSize: kSmallTextSize,
                textColor: kTextGreyColor,
              )
            ],
          ),
        ));
  }
}

class ChooseVideoUpload extends StatelessWidget {
  const ChooseVideoUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              child: choosePosts[0],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[1],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[2],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[3],
            ),
          ],
        ),
        verticalSpace(height: 1),
        Row(
          children: [
            Expanded(
              child: choosePosts[3],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[4],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[5],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[6],
            ),
          ],
        ),
      ],
    );
  }
}

class ChooseImageUplad extends StatelessWidget {
  const ChooseImageUplad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              child: choosePosts[0],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[1],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[2],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[3],
            ),
          ],
        ),
        verticalSpace(height: 1),
        Row(
          children: [
            Expanded(
              child: choosePosts[3],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[4],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[5],
            ),
            horizontalSpace(width: 1),
            Expanded(
              child: choosePosts[6],
            ),
          ],
        ),
      ],
    );
  }
}
