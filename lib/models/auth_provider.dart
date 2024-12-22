import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _login;
  String? _role;

  String? get login => _login;
  String? get role => _role;

  Future<void> loadAuthData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _login = prefs.getString('login');
    _role = prefs.getString('role'); // Загружаем роль
    notifyListeners();
  }

  Future<void> saveAuthData(String login, String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('login', login);
    await prefs.setString('role', role); // Сохраняем роль
    _login = login;
    _role = role;
    notifyListeners();
  }
}