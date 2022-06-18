import 'package:flutter/material.dart';

import '../util/hex_color.dart';
import 'movie_screen.dart';
import 'tv_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 90,
          title: const Padding(
            padding: EdgeInsets.only(top: 36, left: 24, right: 68, bottom: 16),
            child: Text(
              "Find Movies, Tv series,\nand more..",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: HexColor.background,
          bottom: const TabBar(
            unselectedLabelColor: Colors.white30,
            labelPadding: EdgeInsets.symmetric(horizontal: 30),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  color: Color(0xffFF8F71), width: 2), // Indicator height
              insets: EdgeInsets.symmetric(horizontal: 90), // Indicator width
            ),
            tabs: [
              Tab(text: 'Movies'),
              Tab(text: 'Tv Series')
            ],
          ),
        ),
        body: const TabBarView(
          children: [MovieScreen(), TvScreen()],
        ),
      ),
    );
  }
}
