import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/discover/widgets/trend_item_header.dart';
import 'package:frenxy/screens/discover/widgets/trend_slider.dart';

class DiscoverTrendItem extends StatelessWidget {
  const DiscoverTrendItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            DiscoverTrendItemHeader(),
            verticalSpace(height: 10),
            const Expanded(
              child: DiscoverTrendSlider(),
            ),
            verticalSpace(height: 20),
            Divider(
              height: 0,
              color: dividerColor,
            )
          ],
        ),
      ),
    );
  }
}
