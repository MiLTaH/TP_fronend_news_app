class News {
  final String title;
  final String description;
  final String url;

  News({required this.title, required this.description, required this.url});

  // Функция для парсинга JSON
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}
