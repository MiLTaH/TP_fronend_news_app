import 'package:bigus_4/messanger.dart';
import 'package:flutter/material.dart';
import 'package:bigus_4/models/news_model.dart';
import 'package:bigus_4/serviсes/news_service.dart';
import 'package:bigus_4/login_screen.dart';
import 'package:bigus_4/registration_screen.dart';
import 'dart:ui'; // Для размытия

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EzioNews',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => NewsPage(), // Главный экран
        'login': (context) => const LoginScreen(), // Маршрут для экрана входа
        'registration': (context) => const RegistrationScreen(), // Маршрут для экрана регистрации
        'messanger': (context) => const MessagesPage(),
      },
    );
  }
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<News>> futureNews;
  bool _isDrawerOpen = false; // Переменная для состояния бокового меню

  @override
  void initState() {
    super.initState();
    futureNews = NewsService().fetchNews(); // Получаем новости
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Основной экран
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0, // Убираем тень
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                setState(() {
                if (mounted) {
                  _isDrawerOpen = !_isDrawerOpen;
                }
                });
                print("Drawer state: $_isDrawerOpen");
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: const Text(
                  'Вход',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              // Зеленая полоса с надписью
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 170, 255, 166),
                padding: const EdgeInsets.all(8.0),
                child: const Center(
                  child: Text(
                    'Главная',
                    style: TextStyle(fontSize: 26, color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<News>>(
                  future: futureNews,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<News> newsList = snapshot.data!;
                      return ListView.builder(
                        itemCount: newsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(newsList[index].title),
                            subtitle: Text(newsList[index].description),
                            onTap: () {
                              _launchURL(newsList[index].url);
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),

        // Размытие экрана при открытом боковом меню
        if (_isDrawerOpen)
          GestureDetector(
            onTap: () {
              setState(() {
                _isDrawerOpen = false; // Закрыть боковое меню при клике на размытие
              });
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Эффект размытия
              child: Container(
                color: Colors.black.withOpacity(0.3), // Полупрозрачный фон
              ),
            ),
          ),

        // Боковое меню
        if (_isDrawerOpen)
          Align(
            alignment: Alignment.centerLeft,
            child: Material(  // Оборачиваем в Material
              color: Colors.white, // Устанавливаем цвет для материала
              child: Container(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          if (mounted) {
                            _isDrawerOpen = false; // Закрываем меню
                          }
                        });
                      },
                    ),
                    Container(
                      width: double.infinity,
                      color: const Color.fromARGB(255, 170, 255, 166), // Зеленый фон
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        'Главная',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ListTile(
                      title: Text('Сообщества'),
                      onTap: () {
                        // Логика для перехода на "Сообщества"
                      },
                    ),
                    ListTile(
                      title: Text('Сообщения'),
                      onTap: () {
                        Navigator.pushNamed(context, 'messanger');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _launchURL(String url) async {
    // Реализуйте логику для открытия URL
  }
}
