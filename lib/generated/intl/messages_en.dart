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

  static m0(e) => "Failed to connect to server: ${e}";

  static m1(length) => "Comments: ${length}";

  static m2(desc) => "Description: ${desc}";

  static m3(error) => "Error: ${error}";

  static m4(currentPage, totalPages) => "Page ${currentPage} of ${totalPages}";

  static m5(date) => "Published: ${date}";

  static m6(statusCode, body) => "Registration error: \$${statusCode} \$${body}";

  static m7(num) => "Subscribers: ${num}";

  static m8(status) => "Unexpected error: ${status}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Access_denied" : MessageLookupByLibrary.simpleMessage("Access denied"),
    "URL_image" : MessageLookupByLibrary.simpleMessage("image URL"),
    "add_comment" : MessageLookupByLibrary.simpleMessage("Add a comment"),
    "anonymous" : MessageLookupByLibrary.simpleMessage("Anonymous"),
    "auth_err" : MessageLookupByLibrary.simpleMessage("Autorization error"),
    "back" : MessageLookupByLibrary.simpleMessage("Back"),
    "cant_connect" : m0,
    "close" : MessageLookupByLibrary.simpleMessage("Close"),
    "comments" : MessageLookupByLibrary.simpleMessage("Comments"),
    "commentsN" : m1,
    "communitie" : MessageLookupByLibrary.simpleMessage("Communitie"),
    "communities" : MessageLookupByLibrary.simpleMessage("Communities"),
    "confirm" : MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirm_password" : MessageLookupByLibrary.simpleMessage("Confirm password"),
    "create" : MessageLookupByLibrary.simpleMessage("Create"),
    "create_news" : MessageLookupByLibrary.simpleMessage("Create news"),
    "description" : MessageLookupByLibrary.simpleMessage("Description: "),
    "descriptionN" : m2,
    "description_clean" : MessageLookupByLibrary.simpleMessage("Description"),
    "do_not_have_permission" : MessageLookupByLibrary.simpleMessage("You do not have permission to create news."),
    "enter" : MessageLookupByLibrary.simpleMessage("Log in"),
    "enter_login" : MessageLookupByLibrary.simpleMessage("Enter your login"),
    "enter_mail" : MessageLookupByLibrary.simpleMessage("Enter your email"),
    "enter_password" : MessageLookupByLibrary.simpleMessage("Enter your password"),
    "enter_valid_mail" : MessageLookupByLibrary.simpleMessage("Enter a valid email address"),
    "err_token_out" : MessageLookupByLibrary.simpleMessage("Error: token has expired"),
    "error" : m3,
    "error_clean" : MessageLookupByLibrary.simpleMessage("Error"),
    "forward" : MessageLookupByLibrary.simpleMessage("Forward"),
    "have_acc" : MessageLookupByLibrary.simpleMessage("Do you have an account?"),
    "log_in" : MessageLookupByLibrary.simpleMessage("Log in"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "login_3_chars" : MessageLookupByLibrary.simpleMessage("Login must contain at least 3 characters"),
    "mail" : MessageLookupByLibrary.simpleMessage("Mail"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Home"),
    "messanges" : MessageLookupByLibrary.simpleMessage("Messanges"),
    "news" : MessageLookupByLibrary.simpleMessage("News"),
    "no_acc" : MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
    "pageNK" : m4,
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "password_6_chars" : MessageLookupByLibrary.simpleMessage("The password must be at least 6 characters"),
    "passwords_failed" : MessageLookupByLibrary.simpleMessage("Passwords failed"),
    "published" : m5,
    "registrarion_error" : m6,
    "registrarion_succes" : MessageLookupByLibrary.simpleMessage("Registration successful"),
    "search" : MessageLookupByLibrary.simpleMessage("Search..."),
    "select_community" : MessageLookupByLibrary.simpleMessage("Select a community"),
    "select_user" : MessageLookupByLibrary.simpleMessage("Select a user to chat with"),
    "send" : MessageLookupByLibrary.simpleMessage("Send"),
    "sign_in" : MessageLookupByLibrary.simpleMessage("Registration"),
    "subscribe" : MessageLookupByLibrary.simpleMessage("Subscribe"),
    "subscribers" : m7,
    "tags" : MessageLookupByLibrary.simpleMessage("Tags (separated by commas)"),
    "title" : MessageLookupByLibrary.simpleMessage("Title"),
    "to_main_page" : MessageLookupByLibrary.simpleMessage("Home"),
    "token_not_string" : MessageLookupByLibrary.simpleMessage("Token is not a string"),
    "unexpected_error" : m8,
    "write_comment" : MessageLookupByLibrary.simpleMessage("Enter your comment"),
    "write_message" : MessageLookupByLibrary.simpleMessage("Write message...")
  };
}
