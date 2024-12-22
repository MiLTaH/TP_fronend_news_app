// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static m0(e) => "无法连接服务器：${e}";

  static m1(length) => "评论数：${length}";

  static m2(desc) => "描述：${desc}";

  static m3(error) => "错误：${error}";

  static m4(currentPage, totalPages) => "第 ${currentPage} 页，共 ${totalPages} 页";

  static m5(date) => "发布时间：${date}";

  static m6(statusCode, body) => "注册错误：\$${statusCode} \$${body}";

  static m7(num) => "订阅者：${num}";

  static m8(status) => "意外错误：${status}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Access_denied" : MessageLookupByLibrary.simpleMessage("访问被拒绝"),
    "URL_image" : MessageLookupByLibrary.simpleMessage("图片URL"),
    "add_comment" : MessageLookupByLibrary.simpleMessage("添加评论"),
    "anonymous" : MessageLookupByLibrary.simpleMessage("匿名"),
    "auth_err" : MessageLookupByLibrary.simpleMessage("认证错误"),
    "back" : MessageLookupByLibrary.simpleMessage("返回"),
    "cant_connect" : m0,
    "close" : MessageLookupByLibrary.simpleMessage("关闭"),
    "comments" : MessageLookupByLibrary.simpleMessage("评论"),
    "commentsN" : m1,
    "communitie" : MessageLookupByLibrary.simpleMessage("社区"),
    "communities" : MessageLookupByLibrary.simpleMessage("社区"),
    "confirm" : MessageLookupByLibrary.simpleMessage("确认"),
    "confirm_password" : MessageLookupByLibrary.simpleMessage("确认密码"),
    "create" : MessageLookupByLibrary.simpleMessage("创建"),
    "create_news" : MessageLookupByLibrary.simpleMessage("创建新闻"),
    "description" : MessageLookupByLibrary.simpleMessage("描述："),
    "descriptionN" : m2,
    "description_clean" : MessageLookupByLibrary.simpleMessage("描述"),
    "do_not_have_permission" : MessageLookupByLibrary.simpleMessage("您没有权限创建新闻。"),
    "enter" : MessageLookupByLibrary.simpleMessage("进入"),
    "enter_login" : MessageLookupByLibrary.simpleMessage("输入用户名"),
    "enter_mail" : MessageLookupByLibrary.simpleMessage("输入邮箱"),
    "enter_password" : MessageLookupByLibrary.simpleMessage("输入密码"),
    "enter_valid_mail" : MessageLookupByLibrary.simpleMessage("请输入有效的电子邮箱地址"),
    "err_token_out" : MessageLookupByLibrary.simpleMessage("错误：令牌已过期"),
    "error" : m3,
    "error_clean" : MessageLookupByLibrary.simpleMessage("错误"),
    "forward" : MessageLookupByLibrary.simpleMessage("前进"),
    "have_acc" : MessageLookupByLibrary.simpleMessage("已有账号？"),
    "log_in" : MessageLookupByLibrary.simpleMessage("登录"),
    "login" : MessageLookupByLibrary.simpleMessage("用户名"),
    "login_3_chars" : MessageLookupByLibrary.simpleMessage("用户名至少需要3个字符"),
    "mail" : MessageLookupByLibrary.simpleMessage("邮箱"),
    "main_page" : MessageLookupByLibrary.simpleMessage("主页"),
    "messanges" : MessageLookupByLibrary.simpleMessage("消息"),
    "news" : MessageLookupByLibrary.simpleMessage("新闻"),
    "no_acc" : MessageLookupByLibrary.simpleMessage("没有账号？"),
    "pageNK" : m4,
    "password" : MessageLookupByLibrary.simpleMessage("密码"),
    "password_6_chars" : MessageLookupByLibrary.simpleMessage("密码至少需要6个字符"),
    "passwords_failed" : MessageLookupByLibrary.simpleMessage("密码不匹配"),
    "published" : m5,
    "registrarion_error" : m6,
    "registrarion_succes" : MessageLookupByLibrary.simpleMessage("注册成功"),
    "search" : MessageLookupByLibrary.simpleMessage("搜索..."),
    "select_community" : MessageLookupByLibrary.simpleMessage("选择社区"),
    "select_user" : MessageLookupByLibrary.simpleMessage("选择聊天用户"),
    "send" : MessageLookupByLibrary.simpleMessage("发送"),
    "sign_in" : MessageLookupByLibrary.simpleMessage("注册"),
    "subscribe" : MessageLookupByLibrary.simpleMessage("订阅"),
    "subscribers" : m7,
    "tags" : MessageLookupByLibrary.simpleMessage("标签（用逗号分隔）"),
    "title" : MessageLookupByLibrary.simpleMessage("标题"),
    "to_main_page" : MessageLookupByLibrary.simpleMessage("返回主页"),
    "token_not_string" : MessageLookupByLibrary.simpleMessage("令牌不是字符串"),
    "unexpected_error" : m8,
    "write_comment" : MessageLookupByLibrary.simpleMessage("输入您的评论"),
    "write_message" : MessageLookupByLibrary.simpleMessage("输入消息...")
  };
}
