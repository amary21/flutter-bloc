import 'package:flutemovie/ui/home_screen.dart';
import 'package:flutemovie/util/hex_color.dart';
import 'package:flutemovie/util/image_asset.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageAsset('icon-home.png'),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('FluteMovie',
                  style: TextStyle(fontSize: 30, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
