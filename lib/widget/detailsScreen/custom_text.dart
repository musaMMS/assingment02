import 'package:flutter/material.dart';

Widget customText(title){
  return Wrap(
    children: [
      Text(title,style: customTextStyle(),)
    ],
  );
}
TextStyle customTextStyle(){
  return const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
}