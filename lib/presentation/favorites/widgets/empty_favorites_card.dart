import 'package:flutter/material.dart';

class EmotyFavoritesCard extends StatelessWidget {
  const EmotyFavoritesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/empty_favorites.png',
            width: 200,
            height: 200,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 10),
          Text(
            'EMPTY FAVORITES',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
