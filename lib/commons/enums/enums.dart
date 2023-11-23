import 'package:base_getx/commons/enums/app_constants.dart';

/// Language
enum LanguageType {
  JAPAN,
  ENGLISH,
  KOREA,
  VIETNAM,
}

class LanguageTypeHelper {
  String languageCode(LanguageType languageType) {
    switch (languageType) {
      case LanguageType.JAPAN:
        return AppConstants.languageJa;
      case LanguageType.ENGLISH:
        return AppConstants.languageEn;
      case LanguageType.VIETNAM:
        return AppConstants.languageVn;
      case LanguageType.KOREA:
        return AppConstants.languageKo;
    }
  }
}
