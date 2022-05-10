import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class GoogleFacebookLogin extends StatelessWidget {
  const GoogleFacebookLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'or connect with',
            style: TextStyle(
              color: Color.fromRGBO(96, 96, 96, 1),
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                //onTap: ()=>GoogleSignIn().signIn(),
                child: Container(
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(219, 68, 55, 1),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/google.svg',
                      color: Colors.white,
                      width: 45,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                child: Container(
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(66, 103, 178, 1),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      'assets/icons/facebook.svg',
                      color: Colors.white,
                      width: 45,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                child: Container(
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/apple.svg',
                      color: Colors.white,
                      width: 45,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
