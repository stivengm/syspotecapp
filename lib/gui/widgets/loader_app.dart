import 'package:flutter/material.dart';
import 'package:syspotec_app/gui/app_styles.dart';

class LoaderApp extends StatelessWidget {
  const LoaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: blackColor.withOpacity(.8)
      ),
      width: double.infinity,
      height: media.height * 1,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}