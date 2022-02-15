import 'package:flutter/material.dart';

void navigateTo(context, page){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  page),
  );
}

void navigateReplacement(context , page){
   Navigator.pushAndRemoveUntil(
     context,
     MaterialPageRoute(
       builder: (context) => page,
     ),
         (route) => false,
   );
 }