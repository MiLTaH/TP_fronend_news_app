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

  /// `Describtion`
  String get desribtion {
    return Intl.message(
      'Describtion',
      name: 'desribtion',
      desc: '',
      args: [],
    );
  }

  /// `URL of image`
  String get image {
    return Intl.message(
      'URL of image',
      name: 'image',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
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