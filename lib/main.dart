import 'package:bigus_4/messanger.dart';
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
import 'package:bigus_4/community.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MyApp(),
    ),);
}


class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}


class _MyApp extends State<MyApp> {
  Locale _locale = Locale('en'); // Стартовая локаль

  // Функция для изменения локали
  void _changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
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
      locale: _locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('ru', ''),
      ],
      routes: {
        '/': (context) => NewsPage(changeLocale: _changeLocale), // Главный экран
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
  final Function(Locale) changeLocale;

  const NewsPage({Key? key, required this.changeLocale}) : super(key: key);
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  
  late Future<List<News>> futureNews;
  int currentPage = 1; // Текущая страница
  final int newsPerPage = 10; // Количество новостей на одной странице
  bool _isDrawerOpen = false; // Переменная для состояния бокового меню
  String searchQuery = ''; // Хранение текста поиска
  final List<String> languages = ['ENG', 'РУС'];
  String _currentLanguage = 'ENG';
  List<News> filteredNews = []; 
    List<News> mockNews = [
  News(
    title: 'Новость 1',
    description: """Описание для новости 1. Эта новость очень важная
    АВЫАЫВАЫВАЫВ
    ЫВАЫВАЫВАЫВ
    ВЫАЫВАЫВАЫВ""",
    url: 'https://example.com/news1',
    publishedDate: '21.12.2024 10:00',
    tags: ['политика', 'экономика'],
  ),
  News(
    title: 'Новость 2',
    description: 'Описание для новости 2. Читайте всё здесь.',
    url: 'https://example.com/news2',
    publishedDate: '20.12.2024 15:00',
    tags: ['технологии', 'наука'],
  ),
  News(
    title: 'Новость 3',
    description: 'Описание для новости 3. Последние события!',
    url: 'https://example.com/news3',
    publishedDate: '19.12.2024 09:30',
    tags: ['спорт', 'здоровье'],
  ),
  News(
    title: 'Новость 4',
    description: 'Описание для новости 4. Ещё одна важная новость.',
    url: 'https://example.com/news4',
    publishedDate: '18.12.2024 13:45',
    tags: ['искусство', 'музыка'],
  ),
  News(
    title: 'Новость 5',
    description: 'Описание для новости 5. Всё, что вам нужно знать.',
    url: 'https://example.com/news5',
    publishedDate: '17.12.2024 12:00',
    tags: ['образование', 'путешествия'],
  ),
  News(
    title: 'Новость 6',
    description: 'Описание для новости 6. Пропустить невозможно!',
    url: 'https://example.com/news6',
    publishedDate: '16.12.2024 08:15',
    tags: ['финансы', 'инвестиции'],
  ),
  News(
    title: 'Новость 7',
    description: 'Описание для новости 7. Специальный репортаж.',
    url: 'https://example.com/news7',
    publishedDate: '15.12.2024 17:20',
    tags: ['мода', 'стиль'],
  ),
  News(
    title: 'Новость 8',
    description: 'Описание для новости 8. Удивительные открытия.',
    url: 'https://example.com/news8',
    publishedDate: '14.12.2024 11:50',
    tags: ['культура', 'история'],
  ),
  News(
    title: 'Новость 9',
    description: 'Описание для новости 9. Эксклюзивное интервью.',
    url: 'https://example.com/news9',
    publishedDate: '13.12.2024 14:05',
    tags: ['бизнес', 'маркетинг'],
  ),
  News(
    title: 'Новость 10',
    description: 'Описание для новости 10. Важно знать!',
    url: 'https://example.com/news10',
    publishedDate: '12.12.2024 18:40',
    tags: ['политика', 'мировые события'],
  ),
  News(
    title: 'Новость 11',
    description: 'Описание для новости 11. Невероятные факты.',
    url: 'https://example.com/news11',
    publishedDate: '11.12.2024 09:00',
    tags: ['наука', 'исследования'],
  ),
  News(
    title: 'Новость 12',
    description: 'Описание для новости 12. Это должно быть известно.',
    url: 'https://example.com/news12',
    publishedDate: '10.12.2024 16:25',
    tags: ['спорт', 'соревнования'],
  ),
  News(
    title: 'Новость 13',
    description: 'Описание для новости 13. Историческое событие.',
    url: 'https://example.com/news13',
    publishedDate: '09.12.2024 13:10',
    tags: ['технологии', 'инновации'],
  ),
  News(
    title: 'Новость 14',
    description: 'Описание для новости 14. Новые перспективы.',
    url: 'https://example.com/news14',
    publishedDate: '08.12.2024 07:55',
    tags: ['искусство', 'кино'],
  ),
  News(
    title: 'Новость 15',
    description: 'Описание для новости 15. Ещё один важный момент.',
    url: 'https://example.com/news15',
    publishedDate: '07.12.2024 20:30',
    tags: ['здоровье', 'медицина'],
  ),
];

  @override
  void initState() {
    super.initState();
    // futureNews = NewsService().fetchNews(); // Получаем новости
    futureNews = Future.value(mockNews);
  }

  Future<List<String>> fetchNews() async {
    // Имитация загрузки новостей
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(50, (index) => 'Новость ${index + 1}');
  }

void searchNews(String query) async {
  setState(() {
    searchQuery = query; // Обновляем состояние поискового запроса
    filteredNews = [];  // Очищаем текущий список
  });

  try {
    // URL бекенда и конечная точка для поиска новостей
    final url = Uri.parse('https://your-backend-api.com/search');
    
    // Отправка GET-запроса с параметром запроса
    final response = await http.get(url.replace(queryParameters: {'query': query}));

    if (response.statusCode == 200) {
      // Парсим JSON-ответ
      final List<dynamic> data = json.decode(response.body);
      
      // Конвертируем данные в список новостей
      setState(() {
        filteredNews = data.map((item) => News.fromJson(item)).toList();
      });
    } else {
      throw Exception('Ошибка при загрузке данных: ${response.statusCode}');
    }
  } catch (error) {
    setState(() {
      // Если произошла ошибка, можно добавить сообщение
      filteredNews = [];
    });
    print('Ошибка поиска новостей: $error');
  }
}

void _changeLanguage(String language) {
    setState(() {
      _currentLanguage = language;
      switch (language) {
        case 'ENG':
          widget.changeLocale(Locale('en')); // Сменить на английский
          break;
        case 'РУС':
          widget.changeLocale(Locale('ru')); // Сменить на русский
          break;
        default:
          widget.changeLocale(Locale('en'));
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
                                          pagedNews[index].description,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          S.of(context)!.published(pagedNews[index].publishedDate),
                                          style: const TextStyle(color: Colors.red, fontSize: 12),
                                        ),
                                        Text(
                                          '#${pagedNews[index].tags.join(' / #')}',
                                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsDetailScreen(
                                            title: pagedNews[index].title,
                                            description: pagedNews[index].description,
                                            imageUrl: '',
                                            publishedDate: pagedNews[index].publishedDate,
                                            tags: pagedNews[index].tags.join(' / #'),
                                            comments: [],
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
                          if (userRole == 'Admin' || userRole == 'Editor') {
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
