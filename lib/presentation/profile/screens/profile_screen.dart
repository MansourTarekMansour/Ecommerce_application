import 'package:flutter/material.dart';
import 'package:man_shop_app/shared/components/logout_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0).copyWith(top: 80),
        child: Column(
          children: const[
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
