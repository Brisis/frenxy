import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/home_screen.dart';
import 'package:frenxy/screens/me/profile_screen.dart';
import 'package:frenxy/widgets/custom_button.dart';
import 'package:frenxy/widgets/custom_outlined_button.dart';

class PostsSubmitUpload extends StatelessWidget {
  const PostsSubmitUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Submit Post",
            style: TextStyle(
              fontSize: kSubHeaderTextSize,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              PostTopItem(),
              verticalSpace(),
              Divider(
                color: dividerColor,
              ),
              PostLowerItem(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            // border: Border(
            //   top: BorderSide(color: dividerColor, width: 0.5),
            // ),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(routeTransition(const ProfileScreen()));
                  },
                  title: "Drafts",
                ),
              ),
              horizontalSpace(width: 20),
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(routeTransition(const HomeScreen()));
                  },
                  title: "Post",
                ),
              )
            ],
          ),
        ));
  }
}

class PostTopItem extends StatelessWidget {
  const PostTopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: kSubHeaderTextSize,
                      fontWeight: FontWeight.w500,
                      color: kTextGreyColor,
                    ),
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'Describe your video',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                verticalSpace(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        onPressed: () {},
                        title: "# Hashtags",
                        padding: 5,
                        fontSize: kSmallTextSize,
                      ),
                    ),
                    horizontalSpace(),
                    Expanded(
                      child: CustomOutlinedButton(
                        onPressed: () {},
                        title: "@ Friends",
                        padding: 5,
                        fontSize: kSmallTextSize,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          horizontalSpace(width: 20),
          PostCard(),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
          image: AssetImage("assets/images/post5.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: Colors.black38,
            padding: const EdgeInsets.all(5),
            child: const Text(
              "Select cover",
              style: TextStyle(
                fontSize: kSmallTextSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PostLowerItem extends StatelessWidget {
  const PostLowerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline,
              size: 18,
            ),
            horizontalSpace(),
            Expanded(
              child: Text(
                "Who can watch this story",
                style: TextStyle(
                  fontSize: kNormalTextSize,
                  color: kTextGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            horizontalSpace(width: 10),
            TextButton(
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Everyone",
                      style: TextStyle(
                        fontSize: kNormalTextSize,
                        color: kTextGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    horizontalSpace(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: primaryColor,
                    ),
                  ],
                ))
          ],
        ),
        const PostEnableItem(
          title: "Allow comments",
          icon: Icons.chat_bubble_outline,
        ),
        const PostEnableItem(
          title: "Allow Duet",
          icon: Icons.people_alt_outlined,
        ),
        const PostEnableItem(
          title: "Save to device",
          icon: Icons.download_outlined,
        ),
      ],
    );
  }
}

class PostEnableItem extends StatefulWidget {
  final String title;
  final IconData icon;
  const PostEnableItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  State<PostEnableItem> createState() => _PostEnableItemState();
}

class _PostEnableItemState extends State<PostEnableItem> {
  bool isSwitched = true;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          widget.icon,
          size: 18,
        ),
        horizontalSpace(),
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: kNormalTextSize,
              color: kTextGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        horizontalSpace(width: 10),
        Switch(
          onChanged: toggleSwitch,
          value: isSwitched,
          activeColor: Colors.greenAccent.shade400,
          activeTrackColor: Colors.greenAccent.shade100,
        ),
      ],
    );
  }
}
