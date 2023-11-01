enum Flavor {
  DEVELOPMENT,
  PRODUCTION,
  STAGING
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'Acl dev';
      case Flavor.PRODUCTION:
        return 'Acl';
      case Flavor.STAGING:
        return 'Acl staging';
      default:
        return 'title';
    }
  }

}
