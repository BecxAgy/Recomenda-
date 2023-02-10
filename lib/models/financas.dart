import 'dart:math';

import 'package:flutter/material.dart';

class Financas {
  final String id;
  final double renda;
  final bool investe;
  final bool economiza;

  Financas(
      {required this.id,
      required this.renda,
      required this.investe,
      required this.economiza});
}
