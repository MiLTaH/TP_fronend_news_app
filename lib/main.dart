import 'package:flutter/material.dart';
import 'package:bigus_4/serviсes/news_service.dart';  // Импорт сервиса для запросов к API
import 'package:bigus_4/models/news_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<News>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = NewsService().fetchNews(); // Запрос новостей при инициализации
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest News'),
      ),
      body: FutureBuilder<List<News>>(
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
                    _launchURL(newsList[index].url); // Открытие статьи
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Показываем индикатор загрузки пока данные загружаются
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // Функция для открытия ссылок
  void _launchURL(String url) async {
    // Можно использовать url_launcher для открытия ссылки в браузере
    // Добавьте зависимость: url_launcher
    // и реализуйте тут логику открытия
  }
}
