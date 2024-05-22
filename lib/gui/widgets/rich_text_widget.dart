import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String title;
  final String value;
  const RichTextWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$title: ",
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: 17.0,
          fontWeight: FontWeight.bold
        ),
        children: [
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w400
            )
          )
        ]
      )
    );
  }
}