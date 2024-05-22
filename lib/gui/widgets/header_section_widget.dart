import 'package:flutter/material.dart';
import 'package:syspotec_app/gui/app_styles.dart';

class HeaderSectionWidget extends StatelessWidget {
  final String textHeader;
  final Widget widget;
  const HeaderSectionWidget({super.key, required this.textHeader, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textHeader,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith( fontSize: 22.0, color: blackColor, fontWeight: FontWeight.bold ),
        ),
        const SizedBox(height: 20.0),
        widget
      ],
    );
  }
}