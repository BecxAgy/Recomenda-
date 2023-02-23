import 'package:desingprojeto/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Bem-Vindo ao Hecome",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        SvgPicture.asset('assets/icons/chat.svg', height: size.height * 0.45),
        Container(
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          decoration: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(30)),
          child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.AUTH),
              child: Text(
                "Começar",
                style: TextStyle(color: Colors.white),
              )),
        )
      ],
    ));
  }
}
