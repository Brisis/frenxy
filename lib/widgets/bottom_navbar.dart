import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/home_screen.dart';
import 'package:frenxy/screens/me/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color unSelectedColor = Colors.grey.shade200;
    Color selectedColor = Colors.white;
    return Container(
      constraints: const BoxConstraints(
        maxHeight: kBottomNavigationBarHeight + kBottomNavigationPadding,
      ),
      padding: const EdgeInsets.only(top: kBottomNavigationPadding),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(routeTransition(const HomeScreen()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/home-fill.svg',
                    semanticsLabel: 'Home',
                    color: unSelectedColor,
                    width: 20,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 12,
                      color: unSelectedColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          horizontalSpace(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/search-ll.svg',
                  semanticsLabel: 'Search',
                  color: unSelectedColor,
                  width: 20,
                ),
                Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 12,
                    color: unSelectedColor,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(width: 10),
          Expanded(
            child: Column(
              children: [
                Container(
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
                        color: Colors.orange,
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
                        color: Colors.white54,
                        blurRadius: 2.0,
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/add.svg',
                        semanticsLabel: 'Add',
                        color: Colors.black,
                        width: 23,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/chat.svg',
                  semanticsLabel: 'Inbox',
                  color: unSelectedColor,
                  width: 20,
                ),
                Text(
                  "Inbox",
                  style: TextStyle(
                    fontSize: 12,
                    color: unSelectedColor,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(routeTransition(const ProfileScreen()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/user.svg',
                    semanticsLabel: 'Me',
                    color: unSelectedColor,
                    width: 20,
                  ),
                  Text(
                    "Me",
                    style: TextStyle(
                      fontSize: 12,
                      color: unSelectedColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
