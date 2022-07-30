import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/inbox/widgets/inbox_tile_item.dart';
import 'package:frenxy/screens/inbox/widgets/like_tile_item.dart';

class InboxLikesComponent extends StatelessWidget {
  const InboxLikesComponent({Key? key}) : super(key: key);

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
        const InboxLikeTileItem(
          username: "moyondizvo",
          image: "assets/images/bros.png",
        ),
        verticalSpace(height: 20),
        const InboxLikeTileItem(
          username: "benevolentmudzinganyama",
          image: "assets/images/ben.jpeg",
        ),
        verticalSpace(height: 20),
        const InboxLikeTileItem(
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
        const InboxLikeTileItem(
          username: "foodworld",
          image: "assets/images/food.png",
        ),
        verticalSpace(height: 20),
        const InboxLikeTileItem(
          username: "benbris",
          image: "assets/images/ben.jpeg",
        ),
        verticalSpace(height: 20),
        const InboxLikeTileItem(
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
