import 'package:desingprojeto/screens/auth_screen.dart';
import 'package:desingprojeto/screens/categoria_screen.dart';
import 'package:desingprojeto/screens/hobbies_form_screen.dart';
import 'package:desingprojeto/screens/home_screen.dart';
import 'package:desingprojeto/screens/settings_screen.dart';
import 'package:desingprojeto/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/auth.dart';
import 'models/financas_list.dart';
import 'models/hobbies_list.dart';
import 'screens/login_or_home.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FinancasList()),
        ChangeNotifierProvider(create: (_) => HobbiesList()),
        ChangeNotifierProvider(create: (_) => Auth())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          AppRoutes.HOME: (context) => LoginOrHomeScreen(),
          AppRoutes.SETTINGS: (context) => SettingsScreen(),
          AppRoutes.Categoria: (context) => CategoriaScreen(),
          AppRoutes.HOBBIE_FORM: (context) => HobbieFormScreen(),
          AppRoutes.WELCOME: (context) => WelcomeScreen()
        },
      ),
    );
  }
}
