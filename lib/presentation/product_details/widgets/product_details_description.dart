import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';
import 'package:man_shop_app/presentation/home/bloc/home_states.dart';
import 'package:man_shop_app/presentation/product_details/bloc/product_details_cubit.dart';

class ProductDetailsDescription extends StatelessWidget {
  ProductDetailsDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductDetailsCubit>(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        final homeFavorites = BlocProvider.of<HomeCubit>(context)
            .homeModel
            .data
            .products[productCubit.productIndex]
            .inFavorites;
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      productCubit.products.name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<HomeCubit>(context)
                          .isFavorites(id: productCubit.products.id);
                    },
                    child: Icon(
                      Icons.favorite,
                      color: homeFavorites
                          ? Colors.red
                          : Colors.grey.withOpacity(0.5),
                      size: 35,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EGP ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                    ),
                  ),
                  Text(
                    productCubit.products.price.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                    ),
                  ),
                  if(productCubit.products.oldPrice != null)
                  if (productCubit.products.oldPrice >
                      productCubit.products.price)
                    Row(
                      children: [
                        const Text(
                          ' - ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Stack(
                          children: [
                            Positioned(
                              top: 11,
                              child: Container(
                                height: 2.5,
                                width: productCubit.products.oldPrice
                                        .toString()
                                        .length *
                                    12.5,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              productCubit.products.oldPrice.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                productCubit.products.description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }
}
