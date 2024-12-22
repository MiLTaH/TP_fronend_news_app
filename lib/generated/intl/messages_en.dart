// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(error) => "Error: ${error}";

  static m1(currentPage, totalPages) => "Page ${currentPage} of ${totalPages}";

  static m2(date) => "Published: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Access_denied" : MessageLookupByLibrary.simpleMessage("Access denied"),
    "back" : MessageLookupByLibrary.simpleMessage("Back"),
    "communities" : MessageLookupByLibrary.simpleMessage("Communities"),
    "confirm" : MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirm_password" : MessageLookupByLibrary.simpleMessage("Confirm password"),
    "create" : MessageLookupByLibrary.simpleMessage("Create"),
    "create_news" : MessageLookupByLibrary.simpleMessage("Create news"),
    "desribtion" : MessageLookupByLibrary.simpleMessage("Describtion"),
    "do_not_have_permission" : MessageLookupByLibrary.simpleMessage("You do not have permission to create news."),
    "enter" : MessageLookupByLibrary.simpleMessage("Log in"),
    "error" : m0,
    "forward" : MessageLookupByLibrary.simpleMessage("Forward"),
    "have_acc" : MessageLookupByLibrary.simpleMessage("Do you have an account?"),
    "image" : MessageLookupByLibrary.simpleMessage("URL of image"),
    "log_in" : MessageLookupByLibrary.simpleMessage("Log in"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "mail" : MessageLookupByLibrary.simpleMessage("Mail"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Home"),
    "messanges" : MessageLookupByLibrary.simpleMessage("Messanges"),
    "no_acc" : MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
    "pageNK" : m1,
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "published" : m2,
    "search" : MessageLookupByLibrary.simpleMessage("Search..."),
    "select_user" : MessageLookupByLibrary.simpleMessage("Select a user to chat with"),
    "sign_in" : MessageLookupByLibrary.simpleMessage("Registration"),
    "tags" : MessageLookupByLibrary.simpleMessage("Tags (separated by commas)"),
    "title" : MessageLookupByLibrary.simpleMessage("Title"),
    "to_main_page" : MessageLookupByLibrary.simpleMessage("Home"),
    "write_message" : MessageLookupByLibrary.simpleMessage("Write message...")
  };
}
