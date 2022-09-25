import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:man_shop_app/config/routes/routes.dart';
import 'package:man_shop_app/presentation/search/bloc/search_cubit.dart';
import 'package:man_shop_app/shared/components/products_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: BlocBuilder<SearchCubit, SearchStates>(
          builder: (context, state) {
            final searchCubit = BlocProvider.of<SearchCubit>(context);
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF2F3F2),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextField(
                                  //controller: widget.homeAppBarController,
                                  onChanged: (value) {
                                    searchCubit.getSearchData(value);
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        if(searchCubit.searchModel?.data != null)
                          ...[
                            const SizedBox(height: 10),
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 130,
                              child: ListView.separated(
                                itemCount: searchCubit.searchModel!.data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pushNamed(
                                        Routes.productDetailsRoute,
                                        arguments: [
                                          searchCubit.searchModel!.data[index],
                                          searchCubit.searchModel!.data[index].id,
                                        ],
                                      );
                                    },
                                    child: Text(
                                      searchCubit.searchModel!.data[index].name,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return const Divider();
                                },
                              ),
                            ),
                          ]
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
