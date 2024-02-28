import 'package:flutter/material.dart';
import 'package:to_do_app/core/utls/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = const Color(0xff8875FF)});

  final String text;
  final VoidCallback onPressed;
  Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
          ),
      child: Text(
        text,
        style: TextStyle(
          color:AppColors.white,
          fontSize: 20,
           ),
        // style:Theme.of(context).textTheme.displaySmall!.copyWith(
        //   color: backgroundColor,
        // ),
      ),
    );
  }
}
