import 'package:bigus_4/resourses/config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Импорт библиотеки для работы с локальным хранилищем
import 'package:jwt_decoder/jwt_decoder.dart'; // Импорт для работы с JWT

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> registerUser() async {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пароли не совпадают')),
      );
      return;
    }

    final url = Uri.parse('$baseUrl/register'); // Укажите правильный путь

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'login': username,
          'password': password,
          'email': email,
        }),
      );

      print('Ответ от сервера: ${response.body}'); // Логируем полный ответ сервера

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = jsonDecode(response.body);

        if (responseData.containsKey('jwt')) {
          final token = responseData['jwt']; // Извлекаем токен
          print('Полученный токен: $token');

          // Проверяем, что токен — это строка
          if (token is! String) {
            throw FormatException('Токен не является строкой');
          }

          // Проверяем, валиден ли токен
          if (JwtDecoder.isExpired(token)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Ошибка: токен истёк')),
            );
            return;
          }

          // Декодируем токен (опционально)
          final decodedToken = JwtDecoder.decode(token);
          print('Декодированный токен: $decodedToken');

          // Сохраняем токен в локальное хранилище
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwt', token);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Регистрация успешна')),
          );

          Navigator.pushReplacementNamed(context, '/');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ошибка: токен не найден в ответе')),
          );
        }
      } else {
        print('Ошибка регистрации. Статус: ${response.statusCode}, Ответ: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка регистрации: ${response.statusCode} ${response.body}')),
        );
      }
    } catch (e) {
      print('Ошибка: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Регистрация',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField(_usernameController, 'логин'),
              _buildTextField(_emailController, 'почта'),
              _buildTextField(_passwordController, 'пароль', obscureText: true),
              _buildTextField(_confirmPasswordController, 'подтвердите пароль', obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registerUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[100],
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size.fromHeight(56),
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
                  const Text('есть аккаунт?'),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    child: const Text(
                      'войти',
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

  Widget _buildTextField(TextEditingController controller, String hint, {bool obscureText = false}) {
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