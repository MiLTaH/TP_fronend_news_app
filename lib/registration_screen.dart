import 'package:bigus_4/resourses/config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Импорт библиотеки для работы с локальным хранилищем
import 'package:jwt_decoder/jwt_decoder.dart'; // Импорт для работы с JWT
import 'generated/l10n.dart';

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return; // Прерываем регистрацию, если форма не прошла валидацию
    }

    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пароли не совпадают')),
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
            throw FormatException(S.of(context)!.token_not_string);
          }

          // Проверяем, валиден ли токен
          if (JwtDecoder.isExpired(token)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context)!.err_token_out)),
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
            SnackBar(content: Text(S.of(context)!.registrarion_succes)),
          );

          Navigator.pushReplacementNamed(context, '/');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ошибка: токен не найден в ответе')),
          );
        }
        // Вывод информации о статусе и теле ответа для отладки
        print('Ошибка регистрации. Статус: ${response.statusCode}, Ответ: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context)!.registrarion_error(response.statusCode, response.body))),
        );
      }
    } catch (e) {
      // Обработка исключений
      print('Ошибка: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context)!.error(e))),
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
          child: Form(
            key: _formKey, // Используем глобальный ключ для формы
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context)!.sign_in,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildTextField(_usernameController, S.of(context)!.login, validateUsername),
                _buildTextField(_emailController, S.of(context)!.mail, validateEmail),
                _buildTextField(_passwordController, S.of(context)!.password, validatePassword, obscureText: true),
                _buildTextField(_confirmPasswordController, S.of(context)!.confirm_password, validateConfirmPassword, obscureText: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: registerUser, // Вызов функции регистрации при нажатии
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[100],
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(S.of(context)!.confirm),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context)!.have_acc),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text(
                        S.of(context)!.enter,
                        style: TextStyle(color: Colors.pink, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Модифицированный метод _buildTextField с добавлением валидации
  Widget _buildTextField(TextEditingController controller, String hint, String? Function(String?) validator, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator, // Применяем валидацию
      ),
    );
  }

  // Валидация для логина
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context)!.enter_login;
    }
    if (value.length < 3) {
      return S.of(context)!.login_3_chars;
    }
    return null;
  }

  // Валидация для почты
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context)!.enter_mail;
    }
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!regex.hasMatch(value)) {
      return S.of(context)!.enter_valid_mail;
    }
    return null;
  }

  // Валидация для пароля
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context)!.enter_password;
    }
    if (value.length < 6) {
      return S.of(context)!.password_6_chars;
    }
    return null;
  }

  // Валидация для подтверждения пароля
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context)!.confirm_password;
    }
    if (value != _passwordController.text) {
      return S.of(context)!.passwords_failed;
    }
    return null;
  }
}
