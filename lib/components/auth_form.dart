import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

enum AuthMode { Login, SingUp }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  Map<String, String> _authData = {'email': '', 'password': ''};
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  //Functions
  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSingUp() => _authMode == AuthMode.SingUp;

  void switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SingUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    setState(() => _isLoading = true);

    _formKey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);

    if (_isLogin()) {
    } else {
      await auth.singUp(_authData['email']!, _authData['password']!);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: EdgeInsets.all(16),
          height: _isLogin() ? 310 : 400,
          width: device.width * 0.75,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (email) => _authData['email'] = email ?? '',
                ),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _passwordController,
                    onSaved: (password) =>
                        _authData['password'] = password ?? '',
                    validator: (_password) {
                      final password = _password ?? '';

                      if (password.isEmpty || password.length < 7) {
                        return "Informe uma senha válida";
                      }

                      return null;
                    }),

                //Só aparece se for cadastro
                if (_isSingUp())
                  TextFormField(
                      decoration: InputDecoration(labelText: 'Confirmar Senha'),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (_password) {
                        final password = _password ?? '';

                        if (password != _passwordController.text) {
                          return "As senhas precisam ser iguais!";
                        }

                        return null;
                      }),

                SizedBox(
                  height: 20,
                ),

                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _submit,
                        child: Text(_isLogin() ? "Entrar" : "Cadastrar")),

                Spacer(),
                TextButton(
                    onPressed: switchAuthMode,
                    child: Text(_isLogin()
                        ? "Deseja se cadastrar?"
                        : "Já possui conta?"))
              ],
            ),
          ),
        ));
  }
}
