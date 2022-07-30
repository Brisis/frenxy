import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/inbox/widgets/follower_tile_item.dart';
import 'package:frenxy/screens/inbox/widgets/inbox_tile_item.dart';

class InboxFollowersComponent extends StatelessWidget {
  const InboxFollowersComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "This month",
          style: TextStyle(
            fontSize: kSubHeaderTextSize,
            color: kTextGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(),
        const InboxFollowerTileItem(
          username: "moyondizvo",
          image: "assets/images/bros.png",
        ),
        verticalSpace(height: 20),
        const InboxFollowerTileItem(
          username: "benevolentmudzinganyama",
          image: "assets/images/ben.jpeg",
        ),
        verticalSpace(height: 20),
        const InboxFollowerTileItem(
          username: "murozvi",
        ),
        verticalSpace(height: 20),
        Divider(
          color: dividerColor,
          height: 20,
        ),
        Text(
          "Previous",
          style: TextStyle(
            fontSize: kSubHeaderTextSize,
            color: kTextGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(),
        const InboxFollowerTileItem(
          username: "foodworld",
          image: "assets/images/food.png",
        ),
        verticalSpace(height: 20),
        const InboxFollowerTileItem(
          username: "benbris",
          image: "assets/images/ben.jpeg",
        ),
        verticalSpace(height: 20),
        const InboxFollowerTileItem(
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
