import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String publishedDate;
  final List<Map<String, String>> comments;

  NewsDetailScreen({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedDate,
    required this.comments,
  });

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  late TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        widget.comments.add({
          'author': 'Аноним', // Или добавить авторизацию для имени
          'content': _commentController.text,
        });
        _commentController.clear();
      });
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новость'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'На главную',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 170, 255, 166),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок и изображение
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey[300],
                    child: widget.imageUrl.isNotEmpty
                        ? Image.network(widget.imageUrl, fit: BoxFit.cover)
                        : const Icon(Icons.image, size: 60, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Опубликовано: ${widget.publishedDate.toString()}',
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 8)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Описание:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(widget.description),
              const SizedBox(height: 16),
              const Divider(thickness: 1, color: Colors.grey),
              // Поле для добавления комментария
              const Text(
                'Добавить комментарий',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: 'Введите ваш комментарий',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _addComment, // Логика для отправки комментария
                child: const Text('Отправить'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Комментарии',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Комментариев: ${widget.comments.length}'),
              const SizedBox(height: 8),
              // Список комментариев
              ...widget.comments.map((comment) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment['author'] ?? 'Аноним',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(comment['content'] ?? ''),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
