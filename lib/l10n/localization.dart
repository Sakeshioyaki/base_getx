import 'dart:collection';

import 'package:base_getx/l10n/intl_ko.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'intl_en.dart';
import 'intl_ja.dart';
import 'intl_vi.dart';

class LocalizationService extends Translations {
// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static const fallbackLocale = Locale('en', 'US');

// language code của những locale được support
  static final langCodes = ['en', 'vi', 'ko', 'ja'];

// các Locale được support
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
    const Locale('ja', 'JP'),
    const Locale('ko', 'KR'),
  ];

// cái này là Map các language được support đi kèm với mã code của lang đó: cái này dùng để đổ data vào Dropdownbutton và set language mà không cần quan tâm tới language của hệ thống
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
