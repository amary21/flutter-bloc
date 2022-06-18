import 'package:flutter/material.dart';

class DividerView extends StatelessWidget {
  const DividerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20,
      thickness: 1,
      color: Colors.grey,
    );
  }
}
