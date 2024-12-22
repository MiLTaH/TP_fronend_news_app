import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});
  
  @override
  _CreateNewsScreenState createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  // Контроллеры для каждого поля ввода
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  // Переменная для выбранного сообщества
  String? _selectedCommunity;

  // Список сообществ
  final List<String> communities = [
    'Сообщество 1', 'Сообщество 2', 'Сообщество 3'
  ];

  @override
  void dispose() {
    // Освобождаем ресурсы контроллеров
    _titleController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  void _createNews() {
    final String title = _titleController.text;
    final String description = _descriptionController.text;
    final String imageUrl = _imageUrlController.text;
    final String tags = _tagsController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      // Логика для сохранения новости
      print('Заголовок: $title');
      print('Описание: $description');
      print('Изображение: $imageUrl');
      print('Теги: $tags');
      print('Сообщество: $_selectedCommunity');

      // Очистить поля после отправки
      _titleController.clear();
      _descriptionController.clear();
      _imageUrlController.clear();
      _tagsController.clear();
      setState(() {
        _selectedCommunity = null; // Сбросить выбранное сообщество
      });
    } else {
      // Выводим ошибку, если не все обязательные поля заполнены
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, заполните все обязательные поля!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.create_news),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: S.of(context)!.title,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Описание
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: S.of(context)!.description_clean,
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 16),

              // URL изображения
              TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  labelText: S.of(context)!.URL_image,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Теги
              TextField(
                controller: _tagsController,
                decoration: InputDecoration(
                  labelText: S.of(context)!.tags,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
              value: _selectedCommunity,
              hint: Text(S.of(context)!.select_community),
              items: communities.map((community) {
                return DropdownMenuItem<String>(
                  value: community,
                  child: Text(community),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCommunity = value;
                });
              },
              decoration: InputDecoration(
                labelText: S.of(context)!.communitie,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

              // Кнопка отправки
              ElevatedButton(
                onPressed: _createNews,
                child: Text(S.of(context)!.create_news),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
