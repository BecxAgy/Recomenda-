import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/hobbies.dart';
import '../models/hobbies_list.dart';

@override
Widget HobbieCard(String name, String svgSrc, bool isSelected, int index) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(13),
    child: Container(
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.purple[400],
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 17,
            spreadRadius: -23,
            color: Color(0xFFE6E6E6),
          ),
        ],
      ),
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Spacer(),
                SvgPicture.asset(svgSrc),
                Spacer(),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
