class AppConst {
  AppConst._();

  // Pagination (لازم تطابق الباك إند بالضبط)
  static const int defaultPageSize = 10;
  static const int maxPageSize = 100;
  static const int defaultPageNumber = 1;

  // Validation (لازم تطابق الباك إند بالضبط)
  static const int descriptionMaxLength = 500;
  static const int displayNameMaxLength = 100;
  static const int passwordMinLength = 8;

  // Secure Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String tokenExpiryKey = 'token_expiry';

  static const String appName = 'Hisab';
}