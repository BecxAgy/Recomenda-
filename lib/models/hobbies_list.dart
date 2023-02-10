import 'package:flutter/material.dart';

import 'hobbies.dart';

class HobbiesList with ChangeNotifier {
  //lista que posteriormente se tornará um acesso à tabela do banco
  List<Hobbie> _hobbies = [];

  List<Hobbie> get hobbies => [..._hobbies];
}
