import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class CommunityDetailScreen extends StatefulWidget {
  final String name;
  final String description;
  final String imageUrl;
  final int subscribers;

  const CommunityDetailScreen({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.subscribers,
  });

  @override
  _CommunityDetailScreenState createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  late TextEditingController _commentController;
  late int _currentSubscribers;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _currentSubscribers = widget.subscribers;
  }

  void _subscribe() {
    setState(() {
      _currentSubscribers++;
    });
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
        title: Text(S.of(context)!.communitie),
        backgroundColor: const Color.fromARGB(255, 170, 255, 166),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              S.of(context)!.to_main_page,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Название и изображение
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
                          widget.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.of(context)!.subscribers(_currentSubscribers),
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: _subscribe,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 170, 255, 166),
                            foregroundColor: Colors.black,
                          ),
                          child: Text(S.of(context)!.subscribe),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context)!.description,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(widget.description),
              const SizedBox(height: 16),
              const Divider(thickness: 1, color: Colors.grey),
            ]
          ),
        ),
      ),
    );
  }
}
