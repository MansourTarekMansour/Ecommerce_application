import 'package:flutter/material.dart';

void navigateReplacement(context , page){
   Navigator.pushAndRemoveUntil(
     context,
     MaterialPageRoute(
       builder: (context) => page,
     ),
         (route) => false,
   );
 }