class News {
  final int id;
  final int communityId;
  final String title;
  final String? content; // Поле content может быть null
  final DateTime publishDate;
  final String? source; // Поле source может быть null

  News({
    required this.id,
    required this.communityId,
    required this.title,
    this.content,
    required this.publishDate,
    this.source,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as int,
      communityId: json['communityId'] as int,
      title: json['title'] as String,
      content: json['content'] as String?, // Ключ 'content' корректен
      publishDate: DateTime.parse(json['publishedDate'] as String), // Убедитесь в соответствии ключа
      source: json['source'] as String?, // Ключ 'source' корректен
    );
  }
}