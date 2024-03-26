// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(length) => "The line must contain ${length} characters!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "agreement": MessageLookupByLibrary.simpleMessage(
            "I agree to the Terms and Conditions of Use"),
        "appLanguage": MessageLookupByLibrary.simpleMessage("App language"),
        "codeConfirmTitle":
            MessageLookupByLibrary.simpleMessage("Enter a code"),
        "enterACode":
            MessageLookupByLibrary.simpleMessage("Enter the code sent to the"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logon": MessageLookupByLibrary.simpleMessage("Login"),
        "minLength": m0,
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordMismatch":
            MessageLookupByLibrary.simpleMessage("Password mismatch!"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "phoneNumberErrorMessage": MessageLookupByLibrary.simpleMessage(
            "The phone number must consist of numbers!"),
        "ready": MessageLookupByLibrary.simpleMessage("Ready"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registration": MessageLookupByLibrary.simpleMessage("Registration"),
        "registrationPhoneInputTitle": MessageLookupByLibrary.simpleMessage(
            "Enter the phone number to which the password reset code will be sent"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Repeat password"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("This field must be filled!"),
        "restorePassword":
            MessageLookupByLibrary.simpleMessage("Restore the password"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "theme": MessageLookupByLibrary.simpleMessage("Dark theme")
      };
}
