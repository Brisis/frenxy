import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/posts/post_item.dart';

class DiscoverTrendSlider extends StatelessWidget {
  const DiscoverTrendSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: discoverPosts.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width * .3,
          child: discoverPosts[index],
        ),
      ),
    );

    ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: posts.length,
      shrinkWrap: true,
      itemExtent: 3,
      itemBuilder: ((context, index) {
        return Container(
          width: 300,
          color: Colors.red,
          //child: posts[index],
        );
      }),
    );
  }
}
