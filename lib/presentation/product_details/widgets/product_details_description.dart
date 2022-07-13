import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/product_details/bloc/product_details_cubit.dart';

class ProductDetailsDescription extends StatelessWidget {
   const ProductDetailsDescription({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product =
    BlocProvider.of<ProductDetailsCubit>(context).products;
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
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.favorite,
                color: Colors.grey.withOpacity(0.5),
                size: 35,
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
                product.price.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              if (product.oldPrice > product.price)
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
                            width: product
                                .oldPrice
                                .toString()
                                .length *
                                12.5,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          product.oldPrice.toString(),
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
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
