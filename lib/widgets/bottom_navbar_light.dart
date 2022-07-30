import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/discover/discover.dart';
import 'package:frenxy/screens/home_screen.dart';
import 'package:frenxy/screens/inbox/inbox_screen.dart';
import 'package:frenxy/screens/me/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frenxy/screens/posts/screens/choose_upload.dart';
import 'package:frenxy/widgets/bottom_navbar_item.dart';

class BottomNavbarLight extends StatelessWidget {
  final Color? backgroundColor;
  final int? currentIndex;
  const BottomNavbarLight({
    Key? key,
    this.backgroundColor,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color unSelectedColor = kTextGreyColor;
    Color selectedColor = Colors.black;
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 50,
      ),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: dividerColor, width: 0.5),
        ),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomBottomNavbarItem(
              title: "Home",
              icon: 'assets/icons/home.svg',
              selectedIcon: 'assets/icons/home-fill.svg',
              unSelectedColor: unSelectedColor,
              selectedColor: selectedColor,
              onTap: () {
                Navigator.of(context).push(routeTransition(const HomeScreen()));
              },
              isActive: currentIndex == 0,
            ),
          ),
          horizontalSpace(width: 10),
          Expanded(
            child: CustomBottomNavbarItem(
              title: "Discover",
              icon: 'assets/icons/search-ll.svg',
              selectedIcon: 'assets/icons/search.svg',
              unSelectedColor: unSelectedColor,
              selectedColor: selectedColor,
              onTap: () {
                Navigator.of(context).push(routeTransition(const DiscoverScreen()));
              },
              isActive: currentIndex == 1,
            ),
          ),
          horizontalSpace(width: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(routeTransition(const PostsChooseUpload()));
            },
            child: Column(
              children: [
                Container(
                  height: 30,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.red,
                        blurRadius: 2.0,
                        spreadRadius: 0.5,
                      ),
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.blue,
                        blurRadius: 2.0,
                        spreadRadius: 0.5,
                      ),
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.black,
                        blurRadius: 2.0,
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/plus.svg',
                        semanticsLabel: 'Add',
                        color: Colors.white,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(width: 10),
          Expanded(
            child: CustomBottomNavbarItem(
              title: "Inbox",
              icon: 'assets/icons/dm.svg',
              selectedIcon: 'assets/icons/dm-fill.svg',
              unSelectedColor: unSelectedColor,
              selectedColor: selectedColor,
              onTap: () {
                Navigator.of(context).push(routeTransition(const InboxScreen()));
              },
              isActive: currentIndex == 2,
            ),
          ),
          horizontalSpace(width: 10),
          Expanded(
            child: CustomBottomNavbarItem(
              title: "Me",
              icon: 'assets/icons/user.svg',
              selectedIcon: 'assets/icons/user-fill.svg',
              unSelectedColor: unSelectedColor,
              selectedColor: selectedColor,
              onTap: () {
                Navigator.of(context).push(routeTransition(const ProfileScreen()));
              },
              isActive: currentIndex == 3,
            ),
          ),
        ],
      ),
    );
  }
}
