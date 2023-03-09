import 'dart:async';
import 'dart:convert';

import 'package:desingprojeto/data/storage.dart';
import 'package:desingprojeto/exceptions/auth_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiryDate;
  Timer? _logoutTimer;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get uid {
    return isAuth ? _uid : null;
  }

  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=${Constants.webApiKey}';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      print(body);
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uid = body['localId'];

      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );

      Storage.saveMap('userData', {
        'token': _token,
        'email': _email,
        'uId': _uid,
        'expiryDate': _expiryDate!.toIso8601String()
      });

      _autoLogout();
      notifyListeners();
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> tryAutoLogin() async {
    //se estiver auth return
    if (isAuth) return;
    //se map estiver vazio, return
    final userData = await Storage.getMap('userData');

    if (userData.isEmpty) return;
    //se expiryDate está antes, return
    final expiryDate = DateTime.parse(userData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) return;
    //por fim
    _token = userData['token'];
    _email = userData['email'];
    _uid = userData['uId'];
    _expiryDate = userData['expiryDate'];

    _autoLogout();
    notifyListeners();
  }

  void logout() {
    _token = null;
    _email = null;
    _uid = null;
    _expiryDate = null;
    _clearLogoutTimer();
    Storage.remove('userData');
    notifyListeners();
  }

  void _clearLogoutTimer() {
    _logoutTimer?.cancel();
    _logoutTimer = null;
  }

  void _autoLogout() {
    _clearLogoutTimer();
    final timeToLogout = _expiryDate?.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: timeToLogout ?? 0), logout);
  }
}
