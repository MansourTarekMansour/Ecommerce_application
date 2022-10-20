import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/address/bloc/address_cubit.dart';
import 'package:man_shop_app/presentation/address/widgets/add_address_button.dart';
import 'package:man_shop_app/presentation/address/widgets/addresses_list.dart';
import 'package:man_shop_app/shared/components/custom_loading_indicator.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AddressCubit>(context).getAddressData();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200]?.withOpacity(0.7),
            ),
            // ignore: deprecated_member_use
            child: MaterialButton(
              elevation: 0.0,
              highlightElevation: 0.0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              color: Colors.transparent,
              onPressed: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/images/left_arrow.svg',
                color: AppColors.mainColor,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'Addresses',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        actions: const [
          SizedBox(width: 50),
        ],
      ),
      body: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          return state is AddressLoadingState
              ? const CustomLoadingIndicator()
              :  Stack(
                      children: [
                        AddressesList(),
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: AddAddressButton(),
                        )
                      ],
                    );
        },
      ),
    );
  }
}
