import 'package:flutter/material.dart';

class OrderAppBar extends StatefulWidget implements PreferredSizeWidget {
  OrderAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56),
        super(key: key);
  final TextEditingController homeAppBarController = TextEditingController();

  @override
  final Size preferredSize; // default is 56.0

  @override
  _FavoritesAppBarState createState() => _FavoritesAppBarState();
}

class _FavoritesAppBarState extends State<OrderAppBar> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 56,
      width: double.infinity,
      child:  Center(
        child: Text(
          'Orders',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
