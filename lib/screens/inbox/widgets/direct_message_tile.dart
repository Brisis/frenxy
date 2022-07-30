import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';

class InboxDirectMessageTileItem extends StatelessWidget {
  final String username;
  final String? image;
  const InboxDirectMessageTileItem({
    Key? key,
    required this.username,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        horizontalSpace(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      "say hi to your friend.",
                      style: TextStyle(
                        fontSize: kSmallTextSize,
                        color: kTextGreyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              horizontalSpace(width: 20),
              Text(
                "13:03",
                style: TextStyle(
                  fontSize: kSmallTextSize,
                  color: kTextGreyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
