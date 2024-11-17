import 'package:bigus_4/resourses/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/1'), // Предположим, что ваш API принимает PUT запрос на /login
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'password': _passwordController.text,
        'email': _usernameController.text,
      }),
    );

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      // Если сервер вернул 200 OK, значит, авторизация прошла успешно
      var data = jsonDecode(response.body);
      // Сохраните токен или выполняйте другие действия при успешной авторизации
      String token = data['token']; // Измените в зависимости от структуры ответа сервера
      print('Успешная авторизация, токен: $token');

      // Перейдите на главную страницу или куда вам нужно
      Navigator.pushNamed(context, '/');
    } else {
      // Если сервер вернул ошибку
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ошибка'),
            content: const Text('Неверный логин или пароль.'),
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

