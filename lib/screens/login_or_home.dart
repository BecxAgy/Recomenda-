import 'package:desingprojeto/screens/auth_screen.dart';
import 'package:desingprojeto/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class LoginOrHomeScreen extends StatelessWidget {
  const LoginOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return FutureBuilder(
        future: auth.tryAutoLogin(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(
              child: Text("Ocorreu um erro"),
            );
          } else {
            return auth.isAuth ? HomeScreen() : AuthScreen();
          }
        }));
  }
}
