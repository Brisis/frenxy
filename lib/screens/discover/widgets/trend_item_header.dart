import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';

class DiscoverTrendItemHeader extends StatelessWidget {
  const DiscoverTrendItemHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "#",
                    style: TextStyle(
                      fontSize: kHeaderTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              horizontalSpace(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "latenightsnack",
                    style: TextStyle(
                      fontSize: kNormalTextSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Trending hashtag",
                    style: TextStyle(
                      fontSize: kSmallTextSize,
                      color: kTextGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          color: dividerColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "173.5K",
                style: TextStyle(
                  fontSize: kNormalTextSize,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
