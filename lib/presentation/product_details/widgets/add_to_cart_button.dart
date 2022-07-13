import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/product_details/bloc/product_details_cubit.dart';
import 'package:man_shop_app/shared/components/custom_button.dart';

class AddToCartButton extends StatelessWidget {
  AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsCubit =
    BlocProvider.of<ProductDetailsCubit>(context);
    return Container(
      height: 90,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius:
                      const BorderRadiusDirectional.all(Radius.circular(15)),
                ),
                child: PopupMenuButton(
                  padding: const EdgeInsets.all(0),
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          productDetailsCubit.popupMenuValue.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  offset: const Offset(0, -250),
                  onSelected: (_) {
                    Navigator.of(context).pop();
                  },
                  itemBuilder: (ctx) => [
                    PopupMenuItem(
                      onTap: () {
                        productDetailsCubit.setPopupMenuValue(5);
                      },
                      child: const Align(
                          child: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        productDetailsCubit.setPopupMenuValue(4);
                      },
                      child: const Align(
                          child: Text(
                        '4',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        productDetailsCubit.setPopupMenuValue(3);
                      },
                      child: const Align(
                          child: Text(
                        '3',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        productDetailsCubit.setPopupMenuValue(2);
                      },
                      child: const Align(
                          child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        productDetailsCubit.setPopupMenuValue(1);
                      },
                      child: const Align(
                          child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            Flexible(
              flex: 2,
              child: CustomButton(
                text: 'ADD TO CART',
                onPressed: () {},
                height: 60,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                width: MediaQuery.of(context).size.width * 0.6,
                buttonColor: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
