import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/widgets/custom_outlined_button.dart';

class InboxTileItem extends StatelessWidget {
  final String username;
  final String? image;
  const InboxTileItem({
    Key? key,
    required this.username,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
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
                      "started following you.",
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
          ),
        ),
        horizontalSpace(width: 20),
        CustomOutlinedButton(
          onPressed: () {},
          title: "Message",
          padding: 5,
          fontSize: kNormalTextSize,
        )
      ],
    );
  }
}
