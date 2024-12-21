class News {
  final String title;
  final String description;
  final String url;
  final String publishedDate; // Дата публикации
  final List<String> tags; // Теги

  News({
    required this.title,
    required this.description,
    required this.url,
    required this.publishedDate,
    required this.tags,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      publishedDate: json['publishedDate'] ?? '', // Убедитесь, что имя поля соответствует JSON
      tags: List<String>.from(json['tags'] ?? []), // Убедитесь, что это массив строк
    );
  }
}


