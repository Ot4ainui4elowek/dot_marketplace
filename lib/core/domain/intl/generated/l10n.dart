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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
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

  /// `Ready`
  String get ready {
    return Intl.message(
      'Ready',
      name: 'ready',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `App language`
  String get appLanguage {
    return Intl.message(
      'App language',
      name: 'appLanguage',
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

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get logon {
    return Intl.message(
      'Login',
      name: 'logon',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get repeatPassword {
    return Intl.message(
      'Repeat password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password mismatch!`
  String get passwordMismatch {
    return Intl.message(
      'Password mismatch!',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the Terms and Conditions of Use`
  String get agreement {
    return Intl.message(
      'I agree to the Terms and Conditions of Use',
      name: 'agreement',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `This field must be filled!`
  String get requiredField {
    return Intl.message(
      'This field must be filled!',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `The phone number must consist of numbers!`
  String get phoneNumberErrorMessage {
    return Intl.message(
      'The phone number must consist of numbers!',
      name: 'phoneNumberErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `The line must contain {length} characters!`
  String minLength(Object length) {
    return Intl.message(
      'The line must contain $length characters!',
      name: 'minLength',
      desc: '',
      args: [length],
    );
  }

  /// `Dark theme`
  String get theme {
    return Intl.message(
      'Dark theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Restore the password`
  String get restorePassword {
    return Intl.message(
      'Restore the password',
      name: 'restorePassword',
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

  /// `Enter the phone number to which the password reset code will be sent`
  String get registrationPhoneInputTitle {
    return Intl.message(
      'Enter the phone number to which the password reset code will be sent',
      name: 'registrationPhoneInputTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to the`
  String get enterACode {
    return Intl.message(
      'Enter the code sent to the',
      name: 'enterACode',
      desc: '',
      args: [],
    );
  }

  /// `Enter a code`
  String get codePageTitle {
    return Intl.message(
      'Enter a code',
      name: 'codePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get codePageResend {
    return Intl.message(
      'Resend code',
      name: 'codePageResend',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get codePageConfirm {
    return Intl.message(
      'Confirm',
      name: 'codePageConfirm',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Тирасполь`
  String get tiraspol {
    return Intl.message(
      'Тирасполь',
      name: 'tiraspol',
      desc: '',
      args: [],
    );
  }

  /// `Рыбница`
  String get rybnitsa {
    return Intl.message(
      'Рыбница',
      name: 'rybnitsa',
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
