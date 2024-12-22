import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Импортируем пакет для форматирования даты и времени
import 'generated/l10n.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  String? _selectedUser; // Текущий выбранный пользователь
  String _myName = 'Я'; // Ваше имя
  List<Map<String, dynamic>> users = [
    {'name': 'Пользователь 1', 'messages': [
      {'sender': 'Пользователь 1', 'text': 'Привет', 'date': '22.11 22:20'},
      {'sender': 'Пользователь 1', 'text': 'Как дела?', 'date': '22.11 22:20'},
      {'sender': 'Я', 'text': 'Как ты?', 'date': '22.11 22:20'}
    ]},
    {'name': 'Пользователь 2', 'messages': [
      {'sender': 'Пользователь 2', 'text': 'Здравствуй', 'date': '22.11 22:20'},
      {'sender': 'Пользователь 2', 'text': 'Как ты?', 'date': '22.11 22:20'}
    ]},
    {'name': 'Пользователь 3', 'messages': [
      {'sender': 'Пользователь 3', 'text': 'Привет, как жизнь?', 'date': '22.11 22:20'}
    ]},
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  // Метод для отправки сообщения
  void _sendMessage() {
    if (_selectedUser != null && _controller.text.isNotEmpty) {
      setState(() {
        // Находим выбранного пользователя и добавляем его сообщение
        var selectedUser = users.firstWhere((user) => user['name'] == _selectedUser);
        selectedUser['messages'].add({'sender': _myName, 'text': _controller.text, 'date': _formatDate(DateTime.now())}); // Добавляем ваше сообщение
        

        _controller.clear(); // Очищаем поле ввода после отправки
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
    
  }



  void _onKey() {
      _controller.text += '\n'; // Добавляем новую строку в TextField
      _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length));
  }

  void _onSubmitted(String value) {
    // Обрабатываем переход на новую строку
    _onKey();
    // Удерживаем фокус на текстовом поле
    FocusScope.of(context).requestFocus(_focusNode);
  }

  // Метод для форматирования даты и времени
  String _formatDate(DateTime date) {
    return DateFormat('dd.MM HH:mm').format(date); // Форматируем как dd.MM yyyy HH:mm
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.messanges),
        backgroundColor: Color.fromARGB(255, 170, 255, 166), // Зеленый фон
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(S.of(context)!.to_main_page, style: TextStyle(color: Colors.black)),
          )
        ],
      ),
      body: Row(
        children: [
          // Боковое меню (список пользователей)
          if (!isMobile || _selectedUser == null)
                Container(
                  width: 250,
                  color: Colors.grey[200],
                  child: ListView(
                    children: users.map((user) {
                      bool isSelected = user['name'] == _selectedUser;
                      return Container(
                        color: isSelected ? Colors.green[200] : Colors.transparent,
                        child: ListTile(
                          title: Text(user['name']),
                          onTap: () {
                            setState(() {
                              _selectedUser = user['name'];
                            });
                          },
                        ),
                      );
                    }).toList(),
                ),
              ),
          // Панель сообщений
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: _selectedUser == null
                      ? Center(child: Text(S.of(context)!.select_user))
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount: users
                              .firstWhere((user) => user['name'] == _selectedUser)['messages']
                              .length,
                          itemBuilder: (context, index) {
                            var message = users
                                .firstWhere((user) => user['name'] == _selectedUser)['messages']
                                [index];

                            // Проверяем, является ли сообщение отправленным вами
                            bool isUserMessage = message['sender'] == _myName;

                            return Container(
                              padding: EdgeInsets.all(8),
                              alignment: isUserMessage
                                  ? Alignment.centerRight // Ваши сообщения справа
                                  : Alignment.centerLeft, // Сообщения других пользователей слева
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isUserMessage
                                      ? Colors.green[100] // Ваши сообщения зеленые
                                      : Colors.orange[100], // Сообщения других пользователей оранжевые
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(message['text']),
                                    SizedBox(height: 4),
                                    Text(
                                      message['date'],
                                      style: TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
                // Поле для ввода сообщения
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: KeyboardListener(
                          focusNode: FocusNode(), // Фокус для прослушивания клавиш
                          // onKeyEvent: , // Обработчик для нажатия клавиш
                          child: TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            maxLines: null, // Поддержка многострочного ввода
                            decoration: InputDecoration(
                              hintText: S.of(context)!.write_message,
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.send,
                            onSubmitted: _onSubmitted,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _sendMessage,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    },
   );
  }
}
