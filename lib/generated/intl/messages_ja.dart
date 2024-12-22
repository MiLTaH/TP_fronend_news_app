// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static m0(e) => "サーバーに接続できません: ${e}";

  static m1(length) => "コメント数: ${length}";

  static m2(desc) => "説明: ${desc}";

  static m3(error) => "エラー: ${error}";

  static m4(currentPage, totalPages) => "ページ ${currentPage}/${totalPages}";

  static m5(date) => "公開日: ${date}";

  static m6(statusCode, body) => "登録エラー: \$${statusCode} \$${body}";

  static m7(num) => "購読者: ${num}";

  static m8(status) => "予期しないエラー: ${status}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Access_denied" : MessageLookupByLibrary.simpleMessage("アクセスが拒否されました"),
    "URL_image" : MessageLookupByLibrary.simpleMessage("画像URL"),
    "add_comment" : MessageLookupByLibrary.simpleMessage("コメントを追加"),
    "anonymous" : MessageLookupByLibrary.simpleMessage("匿名"),
    "auth_err" : MessageLookupByLibrary.simpleMessage("認証エラー"),
    "back" : MessageLookupByLibrary.simpleMessage("戻る"),
    "cant_connect" : m0,
    "close" : MessageLookupByLibrary.simpleMessage("閉じる"),
    "comments" : MessageLookupByLibrary.simpleMessage("コメント"),
    "commentsN" : m1,
    "communitie" : MessageLookupByLibrary.simpleMessage("コミュニティ"),
    "communities" : MessageLookupByLibrary.simpleMessage("コミュニティ"),
    "confirm" : MessageLookupByLibrary.simpleMessage("確認"),
    "confirm_password" : MessageLookupByLibrary.simpleMessage("パスワードを確認"),
    "create" : MessageLookupByLibrary.simpleMessage("作成"),
    "create_news" : MessageLookupByLibrary.simpleMessage("ニュースを作成"),
    "description" : MessageLookupByLibrary.simpleMessage("説明: "),
    "descriptionN" : m2,
    "description_clean" : MessageLookupByLibrary.simpleMessage("説明"),
    "do_not_have_permission" : MessageLookupByLibrary.simpleMessage("ニュースを作成する権限がありません。"),
    "enter" : MessageLookupByLibrary.simpleMessage("入力"),
    "enter_login" : MessageLookupByLibrary.simpleMessage("ログイン名を入力してください"),
    "enter_mail" : MessageLookupByLibrary.simpleMessage("メールを入力してください"),
    "enter_password" : MessageLookupByLibrary.simpleMessage("パスワードを入力してください"),
    "enter_valid_mail" : MessageLookupByLibrary.simpleMessage("有効なメールアドレスを入力してください"),
    "err_token_out" : MessageLookupByLibrary.simpleMessage("エラー: トークンの有効期限が切れています"),
    "error" : m3,
    "error_clean" : MessageLookupByLibrary.simpleMessage("エラー"),
    "forward" : MessageLookupByLibrary.simpleMessage("次へ"),
    "have_acc" : MessageLookupByLibrary.simpleMessage("アカウントをお持ちですか？"),
    "log_in" : MessageLookupByLibrary.simpleMessage("ログイン"),
    "login" : MessageLookupByLibrary.simpleMessage("ログイン名"),
    "login_3_chars" : MessageLookupByLibrary.simpleMessage("ログイン名は3文字以上である必要があります"),
    "mail" : MessageLookupByLibrary.simpleMessage("メール"),
    "main_page" : MessageLookupByLibrary.simpleMessage("メインページ"),
    "messanges" : MessageLookupByLibrary.simpleMessage("メッセージ"),
    "news" : MessageLookupByLibrary.simpleMessage("ニュース"),
    "no_acc" : MessageLookupByLibrary.simpleMessage("アカウントがありませんか？"),
    "pageNK" : m4,
    "password" : MessageLookupByLibrary.simpleMessage("パスワード"),
    "password_6_chars" : MessageLookupByLibrary.simpleMessage("パスワードは6文字以上である必要があります"),
    "passwords_failed" : MessageLookupByLibrary.simpleMessage("パスワードが一致しません"),
    "published" : m5,
    "registrarion_error" : m6,
    "registrarion_succes" : MessageLookupByLibrary.simpleMessage("登録が成功しました"),
    "search" : MessageLookupByLibrary.simpleMessage("検索..."),
    "select_community" : MessageLookupByLibrary.simpleMessage("コミュニティを選択"),
    "select_user" : MessageLookupByLibrary.simpleMessage("チャットするユーザーを選択"),
    "send" : MessageLookupByLibrary.simpleMessage("送信"),
    "sign_in" : MessageLookupByLibrary.simpleMessage("登録"),
    "subscribe" : MessageLookupByLibrary.simpleMessage("購読"),
    "subscribers" : m7,
    "tags" : MessageLookupByLibrary.simpleMessage("タグ（カンマ区切り）"),
    "title" : MessageLookupByLibrary.simpleMessage("タイトル"),
    "to_main_page" : MessageLookupByLibrary.simpleMessage("メインページへ"),
    "token_not_string" : MessageLookupByLibrary.simpleMessage("トークンが文字列ではありません"),
    "unexpected_error" : m8,
    "write_comment" : MessageLookupByLibrary.simpleMessage("コメントを入力"),
    "write_message" : MessageLookupByLibrary.simpleMessage("メッセージを入力...")
  };
}
