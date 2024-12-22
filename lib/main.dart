import 'package:bigus_4/messanger.dart';
import 'package:bigus_4/resourses/config.dart';
import 'package:flutter/material.dart';
import 'package:bigus_4/models/news_model.dart';
import 'package:bigus_4/serviсes/news_service.dart';
import 'package:bigus_4/create_news_screen.dart';
import 'package:intl/intl.dart';
import 'package:bigus_4/login_screen.dart';
import 'package:bigus_4/news_screen.dart';
import 'package:bigus_4/registration_screen.dart';
import 'dart:ui'; // Для размытия
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:bigus_4/models/auth_provider.dart';
import 'package:bigus_4/models/locale_provider.dart';
import 'package:bigus_4/community.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: MyApp(),
    ),);
}


class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}


class _MyApp extends State<MyApp> {
  // Функция для изменения локали
  void _changeLocale(Locale locale) {
  final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
  localeProvider.setLocale(locale);
}

  @override
  void initState() {
    super.initState();
    // Загрузка данных аутентификации при запуске приложения
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.loadAuthData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleProvider>(context).locale;

    return MaterialApp(
      title: 'EzioNews',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate, // Генерированная локализация, где S - это класс, который генерирует flutter gen-l10n
      ],
      locale: locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('ru', ''),
        Locale('zh', ''),
        Locale('ja', '')
      ],
      routes: {
        '/': (context) => NewsPage(), // Главный экран
        'login': (context) => const LoginScreen(), // Маршрут для экрана входа
        'registration': (context) => const RegistrationScreen(), // Маршрут для экрана регистрации
        'messanger': (context) => const MessagesPage(),
        'creator': (context) => const CreateNewsScreen(),
        'community': (context) => const CommunitiesScreen(),
      },
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  
  late Future<List<News>> futureNews;
  int currentPage = 1; // Текущая страница
  final int newsPerPage = 10; // Количество новостей на одной странице
  bool _isDrawerOpen = false; // Переменная для состояния бокового меню
  String searchQuery = ''; // Хранение текста поиска
  final List<String> languages = ['ENG', 'РУС', '中国人', '日本語'];
  String _currentLanguage = '中国';
  List<News> filteredNews = [];
  List<News> mockNews = [
    News(
      id: 1,
      communityId: 1,
      title: "Последние тенденции в ИТ",
      content: "Описание последнего технологического тренда.",
      publishDate: DateTime.parse('2024-12-21T10:00:00'),
      source: "https://technews.com",
    ),
    News(
      id: 2,
      communityId: 2,
      title: 'Новость 2',
      content: 'Описание для новости 2. Читайте всё здесь.',
      publishDate: DateTime.parse('2024-12-20T15:00:00'),
      source: 'https://example.com/news2',
    ),
    News(
      id: 3,
      communityId: 3,
      title: 'Новость 3',
      content: 'Описание для новости 3. Последние события!',
      publishDate: DateTime.parse('2024-12-19T09:30:00'),
      source: 'https://example.com/news3',
    ),
    News(
      id: 4,
      communityId: 4,
      title: 'Новость 4',
      content: 'Описание для новости 4. Ещё одна важная новость.',
      publishDate: DateTime.parse('2024-12-18T13:45:00'),
      source: 'https://example.com/news4',
    ),
    News(
      id: 5,
      communityId: 5,
      title: 'Новость 5',
      content: 'Описание для новости 5. Всё, что вам нужно знать.',
      publishDate: DateTime.parse('2024-12-17T12:00:00'),
      source: 'https://example.com/news5',
    ),
    News(
      id: 6,
      communityId: 6,
      title: 'Новость 6',
      content: 'Описание для новости 6. Пропустить невозможно!',
      publishDate: DateTime.parse('2024-12-16T08:15:00'),
      source: 'https://example.com/news6',
    ),
    News(
      id: 7,
      communityId: 7,
      title: 'Новость 7',
      content: 'Описание для новости 7. Специальный репортаж.',
      publishDate: DateTime.parse('2024-12-15T17:20:00'), // Преобразование строки в DateTime
      source: 'https://example.com/news7',
    ),
    News(
      id: 8,
      communityId: 8,
      title: 'Новость 8',
      content: 'Описание для новости 8. Удивительные открытия.',
      publishDate: DateTime.parse('2024-12-14T11:50:00'),
      source: 'https://example.com/news8',
    ),
    News(
      id: 9,
      communityId: 9,
      title: 'Новость 9',
      content: 'Описание для новости 9. Эксклюзивное интервью.',
      publishDate: DateTime.parse('2024-12-13T14:05:00'),
      source: 'https://example.com/news9',
    ),
    News(
      id: 10,
      communityId: 10,
      title: 'Новость 10',
      content: 'Описание для новости 10. Важно знать!',
      publishDate: DateTime.parse('2024-12-12T18:40:00'),
      source: 'https://example.com/news10',
    ),
    News(
      id: 11,
      communityId: 11,
      title: 'Новость 11',
      content: 'Описание для новости 11. Невероятные факты.',
      publishDate: DateTime.parse('2024-12-11T09:00:00'),
      source: 'https://example.com/news11',
    ),
    News(
      id: 12,
      communityId: 12,
      title: 'Новость 12',
      content: 'Описание для новости 12. Это должно быть известно.',
      publishDate: DateTime.parse('2024-12-10T16:25:00'),
      source: 'https://example.com/news12',
    ),
    News(
      id: 13,
      communityId: 13,
      title: 'Новость 13',
      content: 'Описание для новости 13. Историческое событие.',
      publishDate: DateTime.parse('2024-12-09T13:10:00'),
      source: 'https://example.com/news13',
    ),
    News(
      id: 14,
      communityId: 14,
      title: 'Новость 14',
      content: 'Описание для новости 14. Новые перспективы.',
      publishDate: DateTime.parse('2024-12-08T07:55:00'),
      source: 'https://example.com/news14',
    ),
    News(
      id: 15,
      communityId: 15,
      title: 'Новость 15',
      content: 'Описание для новости 15. Ещё один важный момент.',
      publishDate: DateTime.parse('2024-12-07T20:30:00'),
      source: 'https://example.com/news15',
    ),
  ];

  @override
  void initState() {
    super.initState();
    futureNews = NewsService().fetchNews(); // Получаем новости
    futureNews = Future.value(mockNews);
  }

  Future<List<String>> fetchNews() async {
    // Имитация загрузки новостей
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(50, (index) => 'Новость ${index + 1}');
  }

  void searchNews(String query) async {
    setState(() {
      searchQuery = query; // Сохраняем текущий запрос
      filteredNews = [];  // Очищаем результаты поиска
    });
    print("Запрос отправлен!");

    try {
      final url = Uri.parse('$baseUrl/api/news/name');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'name': query}), // Формируем JSON тело запроса
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("Запрос успешен!");
        final decoded = utf8.decode(response.bodyBytes); // Декодируем как UTF-8
        final List<dynamic> data = json.decode(decoded); // Парсим ответ из JSON
        setState(() {
          filteredNews = data.map((item) => News.fromJson(item)).toList(); // Преобразуем в объекты News
        });
      } else {
        throw Exception('Ошибка при загрузке данных: ${response.statusCode}');
      }
    } catch (error) {
      setState(() {
        filteredNews = []; // Очищаем результаты при ошибке
      });
      print('Ошибка поиска новостей: $error');
    }
  }

void _changeLanguage(String language) {
  final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

  setState(() {
    _currentLanguage = language;
    switch (language) {
      case 'ENG':
        localeProvider.setLocale(Locale('en')); // Сменить на английский
        break;
      case 'РУС':
        localeProvider.setLocale(Locale('ru')); // Сменить на русский
        break;
      case '中国':
        localeProvider.setLocale(Locale('zh')); // Сменить на русский
        break;
      case '日本語':
        localeProvider.setLocale(Locale('ja')); // Сменить на русский
        break;
      default:
        localeProvider.setLocale(Locale('zh'));
    }
  });
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
            title: TextField(
            onSubmitted: searchNews,
            decoration: InputDecoration(
              hintText: S.of(context)?.search,
              border: InputBorder.none,
              ),
            ),
            actions: [
              PopupMenuButton<String>(
              onSelected: _changeLanguage, // Выбор языка
              itemBuilder: (BuildContext context) {
                return languages.map((String language) {
                  return PopupMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      _currentLanguage, // Текущий выбранный язык
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),
            ),
              // Кнопка для перехода на страницу "Вход"
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Text(
                  S.of(context)!.log_in,
                  style: const TextStyle(color: Colors.black),
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
                child: Center(
                  child: Text(
                    S.of(context)!.main_page,
                    style: const TextStyle(fontSize: 26, color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<News>>(
                  future: futureNews,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // Если есть запрос поиска, фильтруем новости
                      List<News> displayedNews = searchQuery.isNotEmpty
                          ? filteredNews
                          : snapshot.data!;

                      // Пагинация
                      int totalPages = (displayedNews.length / newsPerPage).ceil();
                      int startIndex = (currentPage - 1) * newsPerPage;
                      int endIndex = (startIndex + newsPerPage).clamp(0, displayedNews.length);
                      List<News> pagedNews = displayedNews.sublist(startIndex, endIndex);

                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: pagedNews.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  child: ListTile(
                                    leading: Container(
                                      width: 60,
                                      height: 60,
                                      color: Colors.grey[300], // Заглушка для изображения
                                    ),
                                    title: Text(
                                      pagedNews[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pagedNews[index].content ?? "something",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          S.of(context)!.published(pagedNews[index].publishDate),
                                          style: const TextStyle(color: Colors.red, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsDetailScreen(
                                            title: pagedNews[index].title,
                                            description: pagedNews[index].content ?? 'Описание отсутствует',
                                            imageUrl: '', // Убедитесь, что у вас есть поле для изображения, если оно требуется
                                            publishedDate: DateFormat('dd.MM.yyyy HH:mm').format(pagedNews[index].publishDate),
                                            comments: [], // Если есть комментарии, добавьте их
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          // Пагинация
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: currentPage > 1
                                    ? () {
                                        setState(() {
                                          currentPage--;
                                        });
                                      }
                                    : null,
                                child: Text(S.of(context)!.back),
                              ),
                              Text(S.of(context)!.pageNK(currentPage, totalPages)),
                              ElevatedButton(
                                onPressed: currentPage < totalPages
                                    ? () {
                                        setState(() {
                                          currentPage++;
                                        });
                                      }
                                    : null,
                                child: Text(S.of(context)!.forward),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(S.of(context)!.error(snapshot.error ?? 'Unknown error')));
                    }
                    return const Center(child: CircularProgressIndicator());
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
                      child: Text(
                        S.of(context)!.main_page,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ListTile(
                      title: Text(S.of(context)!.create_news),
                      onTap: () {
                        // Логика для перехода на "создать новость"
                        final authProvider = Provider.of<AuthProvider>(context, listen: false);
                          final userRole = authProvider.role;
                          // Проверка роли
                          if (userRole == 'ADMIN' || userRole == 'EDITOR') {
                            Navigator.pushNamed(context, 'creator');
                          } else {
                            // Показ сообщения, если у пользователя нет доступа
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(S.of(context)!.Access_denied),
                                    content: Text(S.of(context)!.do_not_have_permission),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('ОК'),
                                      ),
                                    ],
                                  );
                                }
                            );
                        }
                      },
                    ),
                    ListTile(
                      title: Text(S.of(context)!.messanges),
                      onTap: () {
                        Navigator.pushNamed(context, 'messanger');
                      },
                    ),
                    ListTile(
                      title: Text(S.of(context)!.communities),
                      onTap: () {
                        Navigator.pushNamed(context, 'community');
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
