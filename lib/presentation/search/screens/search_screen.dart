import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/config/routes/routes.dart';
import 'package:man_shop_app/presentation/search/bloc/search_cubit.dart';
import 'package:man_shop_app/presentation/search/widgets/search_appbar.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: BlocBuilder<SearchCubit, SearchStates>(
          builder: (context, state) {
            final searchCubit = BlocProvider.of<SearchCubit>(context);
            return Scaffold(
              appBar: SearchAppBar(),
              body: SingleChildScrollView(
                child: searchCubit.searchModel?.data != null
                    ? Padding(
                        padding: const EdgeInsets.all(20.0).copyWith(top: 0),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchCubit.searchModel!.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  Routes.productDetailsRoute,
                                  arguments: [
                                    searchCubit.searchModel!.data[index],
                                    searchCubit.searchModel!.data[index].id,
                                  ],
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (index == 0) const SizedBox(height: 10),
                                  Text(
                                    searchCubit.searchModel!.data[index].name,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
                      )
                    : const SizedBox(),
              ),
            );
          },
        ),
      ),
    );
  }
}
