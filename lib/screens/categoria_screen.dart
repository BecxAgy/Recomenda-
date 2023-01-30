import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/categoria.dart';

class CategoriaScreen extends StatelessWidget {
  final Categoria categoria;

  const CategoriaScreen(this.categoria);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(categoria.title));
  }
}
