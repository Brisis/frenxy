import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/inbox/widgets/inbox_tile_item.dart';

class InboxAllActivityComponent extends StatelessWidget {
  const InboxAllActivityComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "New",
          style: TextStyle(
            fontSize: kSubHeaderTextSize,
            color: kTextGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(),
        const InboxTileItem(
          username: "moyondizvo",
          image: "assets/images/bros.png",
        ),
        verticalSpace(height: 20),
        const InboxTileItem(
          username: "benevolentmudzinganyama",
          image: "assets/images/ben.jpeg",
        ),
        verticalSpace(height: 20),
        const InboxTileItem(
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
        const InboxTileItem(
          username: "foodworld",
          image: "assets/images/food.png",
        ),
        verticalSpace(height: 20),
        const InboxTileItem(
          username: "benbris",
          image: "assets/images/ben.jpeg",
        ),
        verticalSpace(height: 20),
        const InboxTileItem(
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
