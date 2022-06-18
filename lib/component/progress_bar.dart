import 'package:flutter/material.dart';

import '../util/hex_color.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: HexColor.accentColor,
      ),
    );
  }
}
