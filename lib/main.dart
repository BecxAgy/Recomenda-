import 'package:desingprojeto/screens/categoria_screen.dart';
import 'package:desingprojeto/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext contejxt) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        AppRoutes.HOME: (context) => HomeScreen(),
        AppRoutes.Categoria: (context) => CategoriaScreen()
      },
    );
  }
}
