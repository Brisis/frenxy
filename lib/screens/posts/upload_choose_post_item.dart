import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';

class PostsChooseUploadItem extends StatelessWidget {
  final String postImage;
  final Function()? onTap;
  final bool? isChosen;
  const PostsChooseUploadItem({
    Key? key,
    required this.postImage,
    this.onTap,
    this.isChosen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
              image: AssetImage(postImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isChosen!
                    ? Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: dividerColor),
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    : Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: dividerColor),
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
              ],
            ),
          )),
    );
  }
}
