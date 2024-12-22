import 'dart:convert';
import 'package:bigus_4/resourses/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'models/auth_provider.dart';

class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});

  @override
  _CreateNewsScreenState createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  String? _selectedCommunity;
  String? userRole;
  List<Map<String, dynamic>> communities = [];

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    await _fetchCommunities();
    _fetchUserRole();
  }

  Future<void> _fetchCommunities() async {
    const url = '$baseUrl/api/community';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        setState(() {
          communities = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        throw Exception('Ошибка при получении сообществ: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Ошибка: $e');
    }
  }

  void _fetchUserRole() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      userRole = authProvider.role;
    });
  }

  Future<void> _createNews() async {
    if (userRole != "EDITOR") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("S.of(context)!.no_permissions")),
      );
      return;
    }

    final String title = _titleController.text.trim();
    final String description = _descriptionController.text.trim();
    final String imageUrl = _imageUrlController.text.trim();

    if (title.isEmpty || description.isEmpty || _selectedCommunity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("S.of(context)!.fill_all_fields")),
      );
      return;
    }

    const url = '$baseUrl/api/news'; // Замените на ваш URL
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "title": title,
          "content": description,
          "source": imageUrl,
          "community": _selectedCommunity,
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("S.of(context)!.news_created")),
        );
        _clearFields();
      } else {
        throw Exception('Ошибка при создании новости: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Ошибка: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("S.of(context)!.error_occurred")),
      );
    }
  }

  void _clearFields() {
    _titleController.clear();
    _descriptionController.clear();
    _imageUrlController.clear();
    setState(() {
      _selectedCommunity = null;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
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
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: S.of(context)!.title,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: S.of(context)!.description_clean,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  labelText: S.of(context)!.URL_image,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCommunity,
                hint: Text(S.of(context)!.select_community),
                items: communities.map((community) {
                  return DropdownMenuItem<String>(
                    value: community['nameCommunity'],
                    child: Text(community['nameCommunity']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCommunity = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: S.of(context)!.communitie,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
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
