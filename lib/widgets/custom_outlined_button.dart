import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color? color;

  const CustomOutlinedButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        backgroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(13),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: color ?? Colors.grey.shade300),
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
