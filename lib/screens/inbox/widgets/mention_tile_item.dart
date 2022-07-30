import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/posts/post_item.dart';

class InboxMentionTileItem extends StatelessWidget {
  final String username;
  final String? image;
  const InboxMentionTileItem({
    Key? key,
    required this.username,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image != null
            ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    "M",
                    style: TextStyle(
                      fontSize: kHeaderTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
        horizontalSpace(width: 15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@$username",
                style: const TextStyle(
                  fontSize: kNormalTextSize,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "mentioned you in a story.",
                style: TextStyle(
                  fontSize: kSmallTextSize,
                  color: kTextGreyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalSpace(),
              SizedBox(
                width: 50,
                height: 60,
                child: PostItem(
                  postImage: "assets/images/post5.jpeg",
                  postLikes: 89,
                  onTap: () {},
                  visibleLikesCount: false,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
