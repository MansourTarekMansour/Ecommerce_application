import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleFacebookLogin extends StatelessWidget {
  const GoogleFacebookLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 50.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(219, 68, 55, 1),
                borderRadius:
                BorderRadiusDirectional.all(Radius.circular(15)),
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset(
                    'assets/icons/google.svg',
                    color: Colors.white,
                    width: 35,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Container(
              height: 50.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(66, 103, 178, 1),
                borderRadius:
                BorderRadiusDirectional.all(Radius.circular(15)),
              ),
              child: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SvgPicture.asset(
                    'assets/icons/facebook.svg',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
