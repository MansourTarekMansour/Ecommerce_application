import 'package:flutter/material.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/address/screens/add_address_scren.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border:
        Border.all(color: AppColors.mainColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          CustomButton(
            text: 'ADD ADDRESS',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAddressScreen()),
              );
            },
            fontSize: 18,
            fontWeight: FontWeight.bold,
            width: MediaQuery.of(context).size.width * 0.95,
            buttonColor: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}
