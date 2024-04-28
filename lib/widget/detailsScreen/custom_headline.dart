import 'package:flutter/cupertino.dart';

Widget headLine(title){
  return Wrap(
    children: [
      Text(title,style: HeadLineStyle(),)
    ],
  );
}
TextStyle HeadLineStyle(){
  return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5
  );
}