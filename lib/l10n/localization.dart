import 'dart:collection';

import 'package:base_getx/l10n/intl_ko.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'intl_en.dart';
import 'intl_ja.dart';
import 'intl_vi.dart';

class LocalizationService extends Translations {
  static const fallbackLocale = Locale('en', 'US');

  static final langCodes = ['en', 'vi', 'ko', 'ja'];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
    const Locale('ja', 'JP'),
    const Locale('ko', 'KR'),
  ];

  static final langs = LinkedHashMap.from(
      {'en': 'English', 'vi': 'Tiếng Việt', 'ja': 'Japan', 'ko': 'Korean'});

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
        'ja_jp': ja,
        'ko_KR': ko,
      };

  static Locale getLocaleLanguage(String languageCode) {
    switch (languageCode) {
      case 'ja':
        return locales[2];
      case 'en':
        return locales[0];
      case 'ko':
        return locales[3];
      case 'vi':
        return locales[1];
      default:
        return locales[0];
    }
  }
}
