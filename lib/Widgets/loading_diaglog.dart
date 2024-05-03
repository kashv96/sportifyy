// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  final String message;
  final String assetPath;

  const LoadingDialog({
    Key? key,
    this.message = "Please wait...",
    this.assetPath = 'assets/json/ball_animation.json',
  }) : super(key: key);

  static void show(BuildContext context,
      {String message = "Please wait...",
      String assetPath = 'assets/json/ball_animation.json'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          LoadingDialog(message: message, assetPath: assetPath),
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(assetPath, width: 200, height: 200),
            Text(message,
                style: const TextStyle(fontSize: 16, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
