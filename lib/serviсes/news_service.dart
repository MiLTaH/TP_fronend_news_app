import 'dart:convert';
//import 'package:http/http.dart' as http;
import '../models/news_model.dart';  // Импорт модели данных

class NewsService {
  // URL API вашего бэкенда
  static const String apiUrl = "http://localhost:8080/backend_news_war_exploded";  // Замените на реальный URL

  // Функция для запроса новостей
  Future<List<News>> fetchNews() async {
    // final response = await http.get(Uri.parse(apiUrl));

    // if (response.statusCode == 200) {
    //   // Парсинг JSON данных из ответа
    //   List jsonResponse = json.decode(response.body);
    //   return jsonResponse.map((news) => News.fromJson(news)).toList();
    // } else {
    //   throw Exception('Failed to load news');
    // }
    return [];
  }
}
