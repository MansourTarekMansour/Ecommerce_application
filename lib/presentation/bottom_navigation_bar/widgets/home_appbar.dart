import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:man_shop_app/config/routes/routes.dart';
import 'package:man_shop_app/core/utils/app_colors.dart';

class HomePageAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomePageAppBar({Key? key})
      : preferredSize = const Size.fromHeight(80),
        super(key: key);
  final TextEditingController homeAppBarController = TextEditingController();

  @override
  final Size preferredSize; // default is 56.0

  @override
  _HomePageAppBarState createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0)
          .copyWith(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.searchRoute);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                    color: Color(0xFFF2F3F2),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
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
                )),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.cartRoute);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/icons/card.svg',
                width: 25,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
