import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';
import 'package:man_shop_app/presentation/home/bloc/home_cubit.dart';
import 'package:man_shop_app/presentation/home/bloc/home_states.dart';
import 'package:shimmer/shimmer.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Stack(
          children: [
            CarouselSlider.builder(
              itemCount: homeCubit.homeModel.data.banners.length,
              itemBuilder: (context, itemIndex, _) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl:
                            homeCubit.homeModel.data.banners[itemIndex].image,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[100]!,
                          highlightColor: Colors.grey[200]!,
                          child:
                              Image.asset('assets/images/almansoury_text.png'),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      // Image.network(
                      //   homeCubit.homeModel.data.banners[itemIndex].image,
                      //   fit: BoxFit.fitWidth,
                      // ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 150,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, _) {
                  homeCubit.changeBannerIndex(index);
                },
              ),
            ),
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 10,
                child: Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return homeCubit.indicatorIndex == index
                          ? Container(
                              width: 20.0,
                              height: 2.5,
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                            )
                          : Container(
                              width: 10.0,
                              height: 2.5,
                              decoration: const BoxDecoration(
                                color: Color(0XFFF4CCCC),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            );
                    },
                    separatorBuilder: (_, index) => const SizedBox(width: 5),
                    itemCount: homeCubit.homeModel.data.banners.length,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
