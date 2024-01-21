import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class CustomAppBarAbmin extends StatelessWidget {
  const CustomAppBarAbmin({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: Styles.textStyle20,
        ),
      ],
    );
  }
}
