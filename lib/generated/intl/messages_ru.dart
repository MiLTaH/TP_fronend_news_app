// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static m0(error) => "Ошибка: ${error}";

  static m1(currentPage, totalPages) => "Страница ${currentPage} из ${totalPages}";

  static m2(date) => "Опубликовано: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Access_denied" : MessageLookupByLibrary.simpleMessage("Доступ запрещён"),
    "back" : MessageLookupByLibrary.simpleMessage("Назад"),
    "communities" : MessageLookupByLibrary.simpleMessage("Сообщества"),
    "confirm" : MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "confirm_password" : MessageLookupByLibrary.simpleMessage("Подтвердите пароль"),
    "create" : MessageLookupByLibrary.simpleMessage("Cоздать"),
    "create_news" : MessageLookupByLibrary.simpleMessage("Создать новость"),
    "desribtion" : MessageLookupByLibrary.simpleMessage("Описание"),
    "do_not_have_permission" : MessageLookupByLibrary.simpleMessage("У вас нет прав для создания новости."),
    "enter" : MessageLookupByLibrary.simpleMessage("Войти"),
    "error" : m0,
    "forward" : MessageLookupByLibrary.simpleMessage("Вперёд"),
    "have_acc" : MessageLookupByLibrary.simpleMessage("Есть аккаунт?"),
    "image" : MessageLookupByLibrary.simpleMessage("URL изображения"),
    "log_in" : MessageLookupByLibrary.simpleMessage("Вход"),
    "login" : MessageLookupByLibrary.simpleMessage("Логин"),
    "mail" : MessageLookupByLibrary.simpleMessage("Почта"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Главная"),
    "messanges" : MessageLookupByLibrary.simpleMessage("Сообщения"),
    "no_acc" : MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
    "pageNK" : m1,
    "password" : MessageLookupByLibrary.simpleMessage("Пароль"),
    "published" : m2,
    "search" : MessageLookupByLibrary.simpleMessage("Поиск..."),
    "select_user" : MessageLookupByLibrary.simpleMessage("Выберите пользователя для чата"),
    "sign_in" : MessageLookupByLibrary.simpleMessage("Регистрация"),
    "tags" : MessageLookupByLibrary.simpleMessage("Теги (через запятую)"),
    "title" : MessageLookupByLibrary.simpleMessage("Заголовок"),
    "to_main_page" : MessageLookupByLibrary.simpleMessage("На главную"),
    "write_message" : MessageLookupByLibrary.simpleMessage("Напишите сообщение...")
  };
}
