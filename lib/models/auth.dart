import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA2iGUM3byFkKjBIwIVRulLdTMND3fz7LE';

  Future<void> singUp(String email, String password) async {
    var response = await http.post(Uri.parse(_url),
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(response.body);
  }
}
