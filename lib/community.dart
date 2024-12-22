import 'package:flutter/material.dart';
import 'package:bigus_4/community_screen.dart';

class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  _CommunitiesScreenState createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen> {
  final List<Map<String, dynamic>> communities = [
    {
      'name': 'Название сообщества 1',
      'description': 'Описание сообщества 1. Это описание сообщества может быть длинным.',
      'subscribers': 120,
      'image': null, // Если нет изображения, будет заглушка
    },
    {
      'name': 'Название сообщества 2',
      'description': 'Описание сообщества 2. Это описание сообщества может быть длинным.',
      'subscribers': 300,
      'image': null,
    },
  ];

  void _navigateToCommunityDetail(BuildContext context, Map<String, dynamic> community) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommunityDetailScreen(
          name: community['name'],
          description: community['description'],
          imageUrl: community['image'] ?? '',
          subscribers: community['subscribers'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сообщества'),
        backgroundColor: const Color.fromARGB(255, 170, 255, 166),
      ),
      body: ListView.builder(
        itemCount: communities.length,
        itemBuilder: (context, index) {
          final community = communities[index];
          return GestureDetector(
            onTap: () => _navigateToCommunityDetail(context, community),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Название сообщества
                    Text(
                      community['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    // Описание
                    Text(
                      'Описание: ${community['description']}',
                      style: const TextStyle(fontSize: 14),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    // Изображение + Подписчики
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Заглушка для изображения
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: community['image'] != null
                              ? Image.network(
                                  community['image'],
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.image,
                                  color: Colors.grey,
                                ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Подписчики: ${community['subscribers']}',
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  communities[index]['subscribers']++;
                                });
                                print('Подписка на ${community['name']}');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 170, 255, 166),
                                foregroundColor: Colors.black,
                              ),
                              child: const Text('Подписаться'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}