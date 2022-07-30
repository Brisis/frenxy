import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color? color;
  final Color? textColor;
  final double? padding;
  final double? fontSize;

  const CustomButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.color,
    this.textColor,
    this.padding,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        backgroundColor: MaterialStateProperty.all(
          color ?? Colors.red,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.all(padding ?? 13),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize ?? kHeaderTextSize,
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
