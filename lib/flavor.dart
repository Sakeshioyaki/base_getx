enum Flavor {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}
class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'ABC-DEV';
      case Flavor.STAGING:
        return 'ABC-STG';
      case Flavor.PRODUCTION:
        return 'ABC-PRO';
      default:
        return 'ABC';
    }
  }
}