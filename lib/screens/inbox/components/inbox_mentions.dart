import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/inbox/widgets/inbox_tile_item.dart';
import 'package:frenxy/screens/inbox/widgets/mention_tile_item.dart';

class InboxMentionsComponent extends StatelessWidget {
  const InboxMentionsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Previous",
          style: TextStyle(
            fontSize: kSubHeaderTextSize,
            color: kTextGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(),
        const InboxMentionTileItem(
          username: "moyondizvo",
          image: "assets/images/bros.png",
        ),
        verticalSpace(height: 20),
        const InboxMentionTileItem(
          username: "benevolentmudzinganyama",
          image: "assets/images/ben.jpeg",
        ),
        verticalSpace(height: 20),
        const InboxMentionTileItem(
          username: "murozvi",
        ),
        verticalSpace(height: 20),
        Divider(
          color: dividerColor,
          height: 20,
        ),
        Text(
          "Old",
          style: TextStyle(
            fontSize: kSubHeaderTextSize,
            color: kTextGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(),
        const InboxMentionTileItem(
          username: "foodworld",
          image: "assets/images/food.png",
        ),
        verticalSpace(height: 20),
        const InboxMentionTileItem(
          username: "benbris",
          image: "assets/images/ben.jpeg",
        ),
        verticalSpace(height: 20),
        const InboxMentionTileItem(
          username: "murozvimukuru",
        ),
        verticalSpace(height: 20),
        Divider(
          color: dividerColor,
        ),
      ],
    );
  }
}
