import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frenxy/constants.dart';

class CustomBottomNavbarItem extends StatelessWidget {
  final String title;
  final String icon;
  final String selectedIcon;
  final Color unSelectedColor;
  final Color selectedColor;
  final bool isActive;
  final Function()? onTap;
  const CustomBottomNavbarItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.selectedIcon,
    required this.unSelectedColor,
    required this.selectedColor,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isActive ? selectedIcon : icon,
            semanticsLabel: 'Search',
            color: isActive ? selectedColor : unSelectedColor,
            width: 20,
          ),
          verticalSpace(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? selectedColor : unSelectedColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'Futura',
            ),
          ),
        ],
      ),
    );
  }
}
