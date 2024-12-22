// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S? current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current!;
    });
  } 

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get main_page {
    return Intl.message(
      'Home',
      name: 'main_page',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get log_in {
    return Intl.message(
      'Log in',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get sign_in {
    return Intl.message(
      'Registration',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Create news`
  String get create_news {
    return Intl.message(
      'Create news',
      name: 'create_news',
      desc: '',
      args: [],
    );
  }

  /// `Messanges`
  String get messanges {
    return Intl.message(
      'Messanges',
      name: 'messanges',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Tags (separated by commas)`
  String get tags {
    return Intl.message(
      'Tags (separated by commas)',
      name: 'tags',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get to_main_page {
    return Intl.message(
      'Home',
      name: 'to_main_page',
      desc: '',
      args: [],
    );
  }

  /// `Select a user to chat with`
  String get select_user {
    return Intl.message(
      'Select a user to chat with',
      name: 'select_user',
      desc: '',
      args: [],
    );
  }

  /// `Select a community`
  String get select_community {
    return Intl.message(
      'Select a community',
      name: 'select_community',
      desc: '',
      args: [],
    );
  }

  /// `Write message...`
  String get write_message {
    return Intl.message(
      'Write message...',
      name: 'write_message',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get mail {
    return Intl.message(
      'Mail',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get no_acc {
    return Intl.message(
      'Don\'t have an account?',
      name: 'no_acc',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account?`
  String get have_acc {
    return Intl.message(
      'Do you have an account?',
      name: 'have_acc',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get enter {
    return Intl.message(
      'Log in',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Published: {date}`
  String published(Object date) {
    return Intl.message(
      'Published: $date',
      name: 'published',
      desc: '',
      args: [date],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Forward`
  String get forward {
    return Intl.message(
      'Forward',
      name: 'forward',
      desc: '',
      args: [],
    );
  }

  /// `Page {currentPage} of {totalPages}`
  String pageNK(Object currentPage, Object totalPages) {
    return Intl.message(
      'Page $currentPage of $totalPages',
      name: 'pageNK',
      desc: '',
      args: [currentPage, totalPages],
    );
  }

  /// `Access denied`
  String get Access_denied {
    return Intl.message(
      'Access denied',
      name: 'Access_denied',
      desc: '',
      args: [],
    );
  }

  /// `You do not have permission to create news.`
  String get do_not_have_permission {
    return Intl.message(
      'You do not have permission to create news.',
      name: 'do_not_have_permission',
      desc: '',
      args: [],
    );
  }

  /// `Communities`
  String get communities {
    return Intl.message(
      'Communities',
      name: 'communities',
      desc: '',
      args: [],
    );
  }

  /// `Communitie`
  String get communitie {
    return Intl.message(
      'Communitie',
      name: 'communitie',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String error(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'error',
      desc: '',
      args: [error],
    );
  }

  /// `Subscribers: {num}`
  String subscribers(Object num) {
    return Intl.message(
      'Subscribers: $num',
      name: 'subscribers',
      desc: '',
      args: [num],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Description: `
  String get description {
    return Intl.message(
      'Description: ',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Description: {desc}`
  String descriptionN(Object desc) {
    return Intl.message(
      'Description: $desc',
      name: 'descriptionN',
      desc: '',
      args: [desc],
    );
  }

  /// `Description`
  String get description_clean {
    return Intl.message(
      'Description',
      name: 'description_clean',
      desc: '',
      args: [],
    );
  }

  /// `image URL`
  String get URL_image {
    return Intl.message(
      'image URL',
      name: 'URL_image',
      desc: '',
      args: [],
    );
  }

  /// `Autorization error`
  String get auth_err {
    return Intl.message(
      'Autorization error',
      name: 'auth_err',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error_clean {
    return Intl.message(
      'Error',
      name: 'error_clean',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error: {status}`
  String unexpected_error(Object status) {
    return Intl.message(
      'Unexpected error: $status',
      name: 'unexpected_error',
      desc: '',
      args: [status],
    );
  }

  /// `Failed to connect to server: {e}`
  String cant_connect(Object e) {
    return Intl.message(
      'Failed to connect to server: $e',
      name: 'cant_connect',
      desc: '',
      args: [e],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Add a comment`
  String get add_comment {
    return Intl.message(
      'Add a comment',
      name: 'add_comment',
      desc: '',
      args: [],
    );
  }

  /// `Enter your comment`
  String get write_comment {
    return Intl.message(
      'Enter your comment',
      name: 'write_comment',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Comments: {length}`
  String commentsN(Object length) {
    return Intl.message(
      'Comments: $length',
      name: 'commentsN',
      desc: '',
      args: [length],
    );
  }

  /// `Anonymous`
  String get anonymous {
    return Intl.message(
      'Anonymous',
      name: 'anonymous',
      desc: '',
      args: [],
    );
  }

  /// `Passwords failed`
  String get passwords_failed {
    return Intl.message(
      'Passwords failed',
      name: 'passwords_failed',
      desc: '',
      args: [],
    );
  }

  /// `Token is not a string`
  String get token_not_string {
    return Intl.message(
      'Token is not a string',
      name: 'token_not_string',
      desc: '',
      args: [],
    );
  }

  /// `Error: token has expired`
  String get err_token_out {
    return Intl.message(
      'Error: token has expired',
      name: 'err_token_out',
      desc: '',
      args: [],
    );
  }

  /// `Registration error: ${statusCode} ${body}`
  String registrarion_error(Object statusCode, Object body) {
    return Intl.message(
      'Registration error: \$$statusCode \$$body',
      name: 'registrarion_error',
      desc: '',
      args: [statusCode, body],
    );
  }

  /// `Registration successful`
  String get registrarion_succes {
    return Intl.message(
      'Registration successful',
      name: 'registrarion_succes',
      desc: '',
      args: [],
    );
  }

  /// `Enter your login`
  String get enter_login {
    return Intl.message(
      'Enter your login',
      name: 'enter_login',
      desc: '',
      args: [],
    );
  }

  /// `Login must contain at least 3 characters`
  String get login_3_chars {
    return Intl.message(
      'Login must contain at least 3 characters',
      name: 'login_3_chars',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_mail {
    return Intl.message(
      'Enter your email',
      name: 'enter_mail',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get enter_valid_mail {
    return Intl.message(
      'Enter a valid email address',
      name: 'enter_valid_mail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `The password must be at least 6 characters`
  String get password_6_chars {
    return Intl.message(
      'The password must be at least 6 characters',
      name: 'password_6_chars',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}