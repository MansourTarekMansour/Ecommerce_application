import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            height: 95,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipOval(
                        child: SvgPicture.asset(
                          homeCubit.categoriesBarData['images']![index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          homeCubit.categoriesBarData['names']![index],
                          style: const TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 15,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
