import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Settings and Privacy",
          style: TextStyle(
            fontSize: kSubHeaderTextSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Account".toUpperCase(),
              style: TextStyle(
                fontSize: kSmallTextSize,
                color: kTextGreyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(),
            SettingsItem(
              title: "Manage Account",
              icon: Icons.person_outline,
              onTap: () {},
            ),
            SettingsItem(
              title: "Privacy",
              icon: Icons.lock_outline,
              onTap: () {},
            ),
            SettingsItem(
              title: "Security",
              icon: Icons.security,
              onTap: () {},
            ),
            SettingsItem(
              title: "Balance",
              icon: CupertinoIcons.money_dollar,
              onTap: () {},
            ),
            SettingsItem(
              title: "XsaevCode",
              icon: Icons.qr_code,
              onTap: () {},
            ),
            SettingsItem(
              title: "Share profile",
              icon: CupertinoIcons.reply,
              onTap: () {},
            ),
            Divider(
              color: dividerColor,
            ),
            Text(
              "Content & Activity".toUpperCase(),
              style: TextStyle(
                fontSize: kSmallTextSize,
                color: kTextGreyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(),
            SettingsItem(
              title: "Push Notifications",
              icon: Icons.notifications_outlined,
              onTap: () {},
            ),
            SettingsItem(
              title: "App language",
              trailing: "English",
              icon: Icons.language,
              onTap: () {},
            ),
            SettingsItem(
              title: "Content preferences",
              icon: Icons.video_camera_back_outlined,
              onTap: () {},
            ),
            SettingsItem(
              title: "Digital Wellbeing",
              icon: Icons.healing,
              onTap: () {},
            ),
            SettingsItem(
              title: "Accessibility",
              icon: Icons.accessibility,
              onTap: () {},
            ),
            Divider(
              color: dividerColor,
            ),
            Text(
              "Cache & Cellular Data".toUpperCase(),
              style: TextStyle(
                fontSize: kSmallTextSize,
                color: kTextGreyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(),
            SettingsItem(
              title: "Free up space",
              icon: CupertinoIcons.delete,
              onTap: () {},
            ),
            SettingsItem(
              title: "Data Saver",
              icon: Icons.data_saver_on,
              onTap: () {},
            ),
            Divider(
              color: dividerColor,
            ),
            Text(
              "Support".toUpperCase(),
              style: TextStyle(
                fontSize: kSmallTextSize,
                color: kTextGreyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(),
            SettingsItem(
              title: "Report a Problem",
              icon: Icons.report_outlined,
              onTap: () {},
            ),
            SettingsItem(
              title: "Help Center",
              icon: Icons.help_outline,
              onTap: () {},
            ),
            SettingsItem(
              title: "Safety Center",
              icon: Icons.safety_check_outlined,
              onTap: () {},
            ),
            Divider(
              color: dividerColor,
            ),
            Text(
              "About".toUpperCase(),
              style: TextStyle(
                fontSize: kSmallTextSize,
                color: kTextGreyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(),
            SettingsItem(
              title: "Community Guidelines",
              icon: Icons.commit_outlined,
              onTap: () {},
            ),
            SettingsItem(
              title: "Terms of Use",
              icon: Icons.folder_outlined,
              onTap: () {},
            ),
            SettingsItem(
              title: "Privacy Policy",
              icon: Icons.file_copy_outlined,
              onTap: () {},
            ),
            SettingsItem(
              title: "Copyright Policy",
              icon: Icons.copyright,
              onTap: () {},
            ),
            Divider(
              color: dividerColor,
            ),
            SettingsItem(
              title: "Logout",
              icon: Icons.logout,
              onTap: () {},
            ),
            verticalSpace(height: 30),
            Text(
              "v1.0.0(2022)",
              style: TextStyle(
                fontSize: kSmallTextSize,
                color: kTextGreyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String? trailing;
  final IconData icon;

  const SettingsItem({
    Key? key,
    required this.onTap,
    required this.title,
    this.trailing,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      dense: true,
      minLeadingWidth: 20,
      onTap: onTap,
      leading: icon == CupertinoIcons.reply
          ? Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: Icon(
                icon,
                size: 20,
                color: kTextGreyColor,
              ),
            )
          : Icon(
              icon,
              size: 20,
              color: kTextGreyColor,
            ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: kNormalTextSize,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing != null
          ? Text(
              trailing!,
              style: const TextStyle(
                fontSize: kNormalTextSize,
                color: Colors.black,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
