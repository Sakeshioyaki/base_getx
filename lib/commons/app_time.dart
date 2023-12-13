import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AppTime {
  static String getCurrentTime(Locale locale) {
    initializeDateFormatting(Platform.localeName);
    DateTime now = DateTime.now();
    String time = '';
    //  'en_US', 'vi_VN', 'ja_jp', 'ko_KR',

    switch (locale.languageCode) {
      case 'vi':
        time =
            '${now.day} Tháng ${now.month} ${DateFormat.Hm().format(now)} | ';
        break;
      case 'ja':
        time = '${now.month} 月 ${now.day} ${DateFormat.Hm().format(now)} | ';
        break;
      default:
        time =
            '${DateFormat.MMMMd().format(now)}  ${DateFormat.jm().format(now)} | ';
        break;
    }
    return time;
  }
}
