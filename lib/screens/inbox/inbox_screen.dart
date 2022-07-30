import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/inbox/widgets/inbox_tile_item.dart';

import 'package:frenxy/widgets/bottom_navbar_light.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  // Initial Selected Value
  String dropdownvalue = 'All activity';

  // List of items in our dropdown menu
  var items = [
    'All activity',
    'Likes',
    'Comments',
    'Mentions',
    'Followers',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // The actions area here
        elevation: 0.5,
        title: SizedBox(
          width: double.infinity,
          height: 40,
          child: Center(
            child: DropdownButton(
              value: dropdownvalue,
              iconSize: 30,
              iconEnabledColor: primaryColor,
              //icon: const Icon(Icons.keyboard_arrow_down),
              underline: const SizedBox.shrink(),
              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: kHeaderTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.email_outlined,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
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
        ),
      ),
      bottomNavigationBar: const BottomNavbarLight(
        backgroundColor: Colors.white,
        currentIndex: 2,
      ),
    );
  }
}
