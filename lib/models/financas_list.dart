import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import 'financas.dart';

class FinancasList with ChangeNotifier {
  final _baseUrl = Constants.baseUrl;

  List<Financas> _items = [];

  List<Financas> get items => [..._items];

  Future<void> saveFinanca(
      Map<String, Object> data, bool investe, bool economiza) {
    final financa = Financas(
        id: Random().nextDouble().toString(),
        renda: data['renda'] as double,
        investe: investe,
        economiza: economiza);

    return addFinanca(financa);
  }

  Future<void> addFinanca(Financas financa) {
    final future = http.post(
      Uri.parse('$_baseUrl/financas.json'),
      body: jsonEncode(
        {
          "renda": financa.renda,
          "id": financa.id,
          "economiza": financa.economiza,
          "investe": financa.investe
        },
      ),
    );

    return future.then<void>((response) {
      final id = jsonDecode(response.body)['name'];
      _items.add(Financas(
        id: id,
        renda: financa.renda,
        economiza: financa.economiza,
        investe: financa.investe,
      ));
      notifyListeners();
    });
  }
}
