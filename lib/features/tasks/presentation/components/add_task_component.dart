import 'package:flutter/material.dart';
import 'package:to_do_app/core/utls/app_colors.dart';
import 'package:to_do_app/core/utls/app_strings.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.validator,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.displayMedium!,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            //hint
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
