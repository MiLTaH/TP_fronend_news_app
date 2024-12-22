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

  static m0(e) => "Не удалось подключиться к серверу: ${e}";

  static m1(length) => "Комментариев: ${length}";

  static m2(desc) => "Описание: ${desc}";

  static m3(error) => "Ошибка: ${error}";

  static m4(currentPage, totalPages) => "Страница ${currentPage} из ${totalPages}";

  static m5(date) => "Опубликовано: ${date}";

  static m6(statusCode, body) => "Ошибка регистрации: \$${statusCode} \$${body}";

  static m7(num) => "Подписчики: ${num}";

  static m8(status) => "Неожиданная ошибка: ${status}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Access_denied" : MessageLookupByLibrary.simpleMessage("Доступ запрещён"),
    "URL_image" : MessageLookupByLibrary.simpleMessage("URL изображения"),
    "add_comment" : MessageLookupByLibrary.simpleMessage("Добавить комментарий"),
    "anonymous" : MessageLookupByLibrary.simpleMessage("Аноним"),
    "auth_err" : MessageLookupByLibrary.simpleMessage("Ошибка авторизации"),
    "back" : MessageLookupByLibrary.simpleMessage("Назад"),
    "cant_connect" : m0,
    "close" : MessageLookupByLibrary.simpleMessage("Закрыть"),
    "comments" : MessageLookupByLibrary.simpleMessage("Комментарии"),
    "commentsN" : m1,
    "communitie" : MessageLookupByLibrary.simpleMessage("Сообщество"),
    "communities" : MessageLookupByLibrary.simpleMessage("Сообщества"),
    "confirm" : MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "confirm_password" : MessageLookupByLibrary.simpleMessage("Подтвердите пароль"),
    "create" : MessageLookupByLibrary.simpleMessage("Cоздать"),
    "create_news" : MessageLookupByLibrary.simpleMessage("Создать новость"),
    "description" : MessageLookupByLibrary.simpleMessage("Описание: "),
    "descriptionN" : m2,
    "description_clean" : MessageLookupByLibrary.simpleMessage("Описание"),
    "do_not_have_permission" : MessageLookupByLibrary.simpleMessage("У вас нет прав для создания новости."),
    "enter" : MessageLookupByLibrary.simpleMessage("Войти"),
    "enter_login" : MessageLookupByLibrary.simpleMessage("Введите логин"),
    "enter_mail" : MessageLookupByLibrary.simpleMessage("Введите почту"),
    "enter_password" : MessageLookupByLibrary.simpleMessage("Введите пароль"),
    "enter_valid_mail" : MessageLookupByLibrary.simpleMessage("Введите валидный адрес электронной почты"),
    "err_token_out" : MessageLookupByLibrary.simpleMessage("Ошибка: токен истёк"),
    "error" : m3,
    "error_clean" : MessageLookupByLibrary.simpleMessage("Ошибка"),
    "forward" : MessageLookupByLibrary.simpleMessage("Вперёд"),
    "have_acc" : MessageLookupByLibrary.simpleMessage("Есть аккаунт?"),
    "log_in" : MessageLookupByLibrary.simpleMessage("Вход"),
    "login" : MessageLookupByLibrary.simpleMessage("Логин"),
    "login_3_chars" : MessageLookupByLibrary.simpleMessage("Логин должен содержать не менее 3 символов"),
    "mail" : MessageLookupByLibrary.simpleMessage("Почта"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Главная"),
    "messanges" : MessageLookupByLibrary.simpleMessage("Сообщения"),
    "news" : MessageLookupByLibrary.simpleMessage("Новость"),
    "no_acc" : MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
    "pageNK" : m4,
    "password" : MessageLookupByLibrary.simpleMessage("Пароль"),
    "password_6_chars" : MessageLookupByLibrary.simpleMessage("Пароль должен быть не менее 6 символов"),
    "passwords_failed" : MessageLookupByLibrary.simpleMessage("Пароли не совпадают"),
    "published" : m5,
    "registrarion_error" : m6,
    "registrarion_succes" : MessageLookupByLibrary.simpleMessage("Регистрация успешна"),
    "search" : MessageLookupByLibrary.simpleMessage("Поиск..."),
    "select_community" : MessageLookupByLibrary.simpleMessage("Выберите сообщество"),
    "select_user" : MessageLookupByLibrary.simpleMessage("Выберите пользователя для чата"),
    "send" : MessageLookupByLibrary.simpleMessage("Отправить"),
    "sign_in" : MessageLookupByLibrary.simpleMessage("Регистрация"),
    "subscribe" : MessageLookupByLibrary.simpleMessage("Подписаться"),
    "subscribers" : m7,
    "tags" : MessageLookupByLibrary.simpleMessage("Теги (через запятую)"),
    "title" : MessageLookupByLibrary.simpleMessage("Заголовок"),
    "to_main_page" : MessageLookupByLibrary.simpleMessage("На главную"),
    "token_not_string" : MessageLookupByLibrary.simpleMessage("Токен не является строкой"),
    "unexpected_error" : m8,
    "write_comment" : MessageLookupByLibrary.simpleMessage("Введите ваш комментарий"),
    "write_message" : MessageLookupByLibrary.simpleMessage("Напишите сообщение...")
  };
}
