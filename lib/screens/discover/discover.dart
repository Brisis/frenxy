import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/discover/widgets/advert_slider.dart';
import 'package:frenxy/screens/discover/widgets/trend_item.dart';

import 'package:frenxy/widgets/bottom_navbar_light.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // The search area here
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              textAlign: TextAlign.justify,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontSize: kHeaderTextSize,
                fontWeight: FontWeight.w500,
                color: kTextGreyColor,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: kTextGreyColor,
                  //size: 20,
                ),

                // suffixIcon: IconButton(
                //   icon: const Icon(Icons.clear),
                //   onPressed: () {
                //     /* Clear the search field */
                //   },
                // ),

                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const DiscoverAdvertSlider(),
          verticalSpace(height: 10),
          const DiscoverTrendItem(),
          const DiscoverTrendItem(),
          const DiscoverTrendItem(),
          const DiscoverTrendItem(),
          verticalSpace(),
        ],
      ),
      bottomNavigationBar: const BottomNavbarLight(
        backgroundColor: Colors.white,
        currentIndex: 1,
      ),
    );
  }
}
