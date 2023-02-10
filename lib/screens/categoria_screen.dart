import 'package:desingprojeto/screens/financas_form.screen.dart';
import 'package:desingprojeto/screens/hobbies_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/categoria.dart';
import 'not_found_screen.dart';

class CategoriaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoria = ModalRoute.of(context)?.settings.arguments as Categoria;

    Widget categoriaScreen() {
      if (categoria.title == "Hobbies") {
        return HobbieFormScreen();
      }

      if (categoria.title == "Finanças") {
        return FinancasFormScreen();
      }

      return NotFoundScreen();
    }

    return categoriaScreen();
  }
}
