import 'package:flutter/material.dart';

class DiscoverAdvertSlider extends StatelessWidget {
  const DiscoverAdvertSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/pubg.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
