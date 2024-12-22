import 'package:flutter/material.dart';

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
        title: const Text('Создать новость'),
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
                decoration: const InputDecoration(
                  labelText: 'Заголовок',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Описание
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Описание',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 16),

              // URL изображения
              TextField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'URL изображения',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Теги
              TextField(
                controller: _tagsController,
                decoration: const InputDecoration(
                  labelText: 'Теги (через запятую)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
              value: _selectedCommunity,
              hint: const Text('Выберите сообщество'),
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
              decoration: const InputDecoration(
                labelText: 'Сообщество',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

              // Кнопка отправки
              ElevatedButton(
                onPressed: _createNews,
                child: const Text('Создать новость'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
