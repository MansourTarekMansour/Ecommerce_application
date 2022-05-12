import 'package:flutter/material.dart';
import 'package:man_shop_app/presentation/authentication/login/screens/login_screen.dart';
import 'package:man_shop_app/shared/components/navigation.dart';
import 'package:man_shop_app/shared/network/local/cache_helper.dart';
import 'package:onboarding/onboarding.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  void submit(context) {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) => navigateReplacement(context, LoginScreen()));
  }

  final onBoardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          SvgPicture.asset('assets/images/on_boarding_shopping.svg'),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'WANT TO SHOP',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromRGBO(96, 96, 96, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            'The store contains various products that meet all needs and with the highest standards of quality and safety',
            style: TextStyle(
              color: Color.fromRGBO(96, 96, 96, 1),
              fontSize: 15,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          SvgPicture.asset('assets/images/on_boarding_cart.svg'),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'ADD TO CART',
              style: TextStyle(
                color: Color.fromRGBO(96, 96, 96, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Add to cart everything you want to buy',
              style: TextStyle(
                color: Color.fromRGBO(96, 96, 96, 1),
                fontSize: 15,
                //fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          SvgPicture.asset('assets/images/on_boarding_delivery.svg'),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'DELIVERY ARRIVES SOON',
              style: TextStyle(
                color: Color.fromRGBO(96, 96, 96, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'The delivery representative will reach you as soon as possible and to your doorstep or to a place you want',
              style: TextStyle(
                color: Color.fromRGBO(96, 96, 96, 1),
                fontSize: 15,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        background: Colors.white70,
        skipButtonStyle: const SkipButtonStyle(
          skipButtonText: Text(
            'skip',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        proceedButtonStyle: ProceedButtonStyle(
          proceedButtonColor: const Color.fromRGBO(64, 123, 255, 1),
          proceedpButtonText: const Text(
            'let\'s Start',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          proceedButtonRoute: (context) {
            return submit(context);
          },
        ),
        isSkippable: true,
        pages: onBoardingPagesList,
        indicator: Indicator(
          activeIndicator: const ActiveIndicator(
            color: Color.fromRGBO(96, 96, 96, 1),
          ),
          closedIndicator: const ClosedIndicator(
            color: Color.fromRGBO(96, 96, 96, 1),
          ),
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
              polygon: DesignType.polygon_circle,
            ),
          ),
        ),
      ),
    );
  }
}
