import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/config/routes/routes.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/cart/bloc/cart_cubit.dart';

class CartProductsWidget extends StatelessWidget {
  CartProductsWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ListView.separated(
          itemCount: cartCubit.cartModel.cartItems.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
          final product = cartCubit.cartModel.cartItems[index].product;
            return GestureDetector(
              onTap: () {
                Navigator?.of(context).pushNamed(
                  Routes.productDetailsRoute,
                  arguments: [
                    product,
                    product.id,
                  ],
                );
              },
              child: Container(
                height: 150.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                      color: AppColors.mainColor.withOpacity(0.2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 120,
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                          height: 150,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 155,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 15.0),
                            child: Text(
                              product.name,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EGP ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                                Text(
                                  product.price.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                              const BorderRadiusDirectional.all(Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0).copyWith(left: 15),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 2),
                                        Text(
                                          'amount ',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                        const SizedBox(width: 25),
                                        Text(
                                          'total price',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.4),
                                            borderRadius:
                                            const BorderRadiusDirectional.all(Radius.circular(15)),
                                          ),
                                          child: PopupMenuButton(
                                            offset: const Offset(0, 40),
                                            padding: const EdgeInsets.all(0),
                                            constraints: const BoxConstraints(
                                              minWidth: 70,
                                              maxWidth: 70,
                                            ),
                                            icon: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  color: AppColors.mainColor,
                                                  size: 30,
                                                ),
                                                const SizedBox(width: 0),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 15.0),
                                                  child: Text(
                                                    cartCubit.cartModel.cartItems[index].quantity.toString(),
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColors.mainColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onSelected: (_) {
                                              Navigator.of(context).pop();
                                            },
                                            itemBuilder: (ctx) => [
                                              PopupMenuItem(
                                                onTap: () {
                                                  cartCubit.setPopupMenuValue(1, index);
                                                },
                                                child: const Align(
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                              ),
                                              PopupMenuItem(
                                                onTap: () {
                                                  cartCubit.setPopupMenuValue(2, index);
                                                },
                                                child: const Align(
                                                    child: Text(
                                                      '2',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                              ),
                                              PopupMenuItem(
                                                onTap: () {
                                                  cartCubit.setPopupMenuValue(3, index);
                                                },
                                                child: const Align(
                                                    child: Text(
                                                      '3',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                              ),
                                              PopupMenuItem(
                                                onTap: () {
                                                  cartCubit.setPopupMenuValue(4, index);
                                                },
                                                child: const Align(
                                                    child: Text(
                                                      '4',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                              ),
                                              PopupMenuItem(
                                                onTap: () {
                                                  cartCubit.setPopupMenuValue(5, index);
                                                },
                                                child: const Align(
                                                    child: Text(
                                                      '5',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 30),
                                        Align(
                                          child: Text(
                                            '${cartCubit.cartModel.cartItems[index].quantity * product.price}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
    );
  }
}
