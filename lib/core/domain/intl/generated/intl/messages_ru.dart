// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(length) => "В строке должно быть ${length} символов!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "agreement": MessageLookupByLibrary.simpleMessage(
            "Я согласен с Правилами и условиями использования"),
        "appLanguage": MessageLookupByLibrary.simpleMessage("Язык приложения"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "login": MessageLookupByLibrary.simpleMessage("Вход"),
        "logon": MessageLookupByLibrary.simpleMessage("Войти"),
        "minLength": m0,
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordMismatch":
            MessageLookupByLibrary.simpleMessage("Пароли не совпадают!"),
        "phone": MessageLookupByLibrary.simpleMessage("Телефон"),
        "phoneNumberErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Номер телефона должен состоять из цифр!"),
        "ready": MessageLookupByLibrary.simpleMessage("Готово"),
        "register": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Повторите пароль"),
        "requiredField": MessageLookupByLibrary.simpleMessage(
            "Это поле должно быть заполнено!"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "theme": MessageLookupByLibrary.simpleMessage("Тема")
      };
}
