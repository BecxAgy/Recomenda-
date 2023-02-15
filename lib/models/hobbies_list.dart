import 'package:flutter/material.dart';

import 'hobbies.dart';

class HobbiesList with ChangeNotifier {
  //lista que posteriormente se tornará um acesso à tabela do banco
  List<Hobbie> _hobbies = [
    Hobbie(
      id: "1",
      name: "Comer",
      svgSrc: "assets/icons/Hamburger.svg",
    ),
    Hobbie(
      id: "2",
      name: "Meditação",
      svgSrc: "assets/icons/Meditation.svg",
    ),
    Hobbie(
      id: "3",
      name: "Exercícios",
      svgSrc: "assets/icons/Excrecises.svg",
    ),
    Hobbie(
      id: "4",
      name: "Yoga",
      svgSrc: "assets/icons/yoga.svg",
    )
  ];

  List<Hobbie> selectedHobbies = [];

  List<Hobbie> get hobbies => [..._hobbies];

  void addHobbie() {}
}
