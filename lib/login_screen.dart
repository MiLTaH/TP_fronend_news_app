import 'package:bigus_4/resourses/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:bigus_4/models/auth_provider.dart';

void handleToken(String token) {
  if (JwtDecoder.isExpired(token)) {
    print('Токен истёк');
  } else {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print('Полезная нагрузка: $decodedToken');
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> _login() async {
    try {
      // Отправка POST-запроса на сервер
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'login': _usernameController.text,
          'password': _passwordController.text,
        }),
      );

      print('Ответ от сервера: ${response.body}'); // Логируем полный ответ сервера

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // сохранение логина
        String login = _usernameController.text;
        // Обработка успешного ответа
        var data = jsonDecode(response.body);
        String token = data['jwt']; // Получаем токен из JSON
        print('Полученный токен: $token');

        String role = await _getUserRole(token);

        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        await authProvider.saveAuthData(login, role);

        // Сохранение токена
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt', token);

        // Работа с токеном
        handleToken(token);

        // Переход на главную страницу
        Navigator.pushNamed(context, '/');
      } else if (response.statusCode == 401) {
        // Обработка ошибки авторизации
        var data = jsonDecode(response.body);
        String errorMessage = data['error'];
        _showErrorDialog('Ошибка авторизации', errorMessage);
      } else {
        // Обработка других ошибок
        _showErrorDialog('Ошибка', 'Неожиданная ошибка: ${response.statusCode}');
      }
    } catch (e) {
      // Обработка исключений, например, при проблемах с сетью
      _showErrorDialog('Ошибка', 'Не удалось подключиться к серверу: $e');
    }
  }

  Future<String> _getUserRole(String token) async {
  try {
    final uriEditor = Uri.parse('$baseUrl/users/updateUserRoleEditor');
    final uriAdmin = Uri.parse('$baseUrl/users/updateUserRoleAdmin');

    // Отправка запроса для проверки роли "Editor"
    final responseEditor = await http.put(
      uriEditor,
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (responseEditor.statusCode >= 200 && responseEditor.statusCode < 300) {
      return 'Editor';
    }

    // Отправка запроса для проверки роли "Admin"
    final responseAdmin = await http.put(
      uriAdmin,
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (responseAdmin.statusCode >= 200 && responseAdmin.statusCode < 300) {
      return 'Admin';
    }

    return 'User';
  } catch (error) {
    print('Ошибка определения роли: $error');
    throw error;
  }
}

// Функция для показа диалогов с ошибками
  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black), // Иконка крестика
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        backgroundColor: Colors.white, // Цвет AppBar
        elevation: 0, // Убираем тень
      ),
      body: Center(
        child: Container(
          width: 300, // Фиксированная ширина для контейнера
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Вход',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField('почта', _usernameController),
              _buildTextField('пароль', _passwordController, obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login, // Логика для подтверждения входа
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[100],
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size.fromHeight(56), // Размер кнопки соответствует полям
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Подтвердить'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('нет аккаунта?'),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'registration');
                    },
                    child: const Text(
                      'создать',
                      style: TextStyle(color: Colors.pink, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

