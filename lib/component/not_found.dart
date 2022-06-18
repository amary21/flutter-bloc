import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset('assets/animation/not_found.json',
            width: 250, height: 250));
  }
}
