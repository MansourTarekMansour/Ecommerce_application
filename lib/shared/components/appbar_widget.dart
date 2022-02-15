import 'package:flutter/material.dart';

class HomePageAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomePageAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  TextEditingController homeAppBarController = TextEditingController();

  @override
  final Size preferredSize; // default is 56.0

  @override
  _HomePageAppBarState createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
