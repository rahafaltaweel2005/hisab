import 'package:intl/intl.dart' show NumberFormat;

class CurrencyFormatter {
  static final _format = NumberFormat.currency(
    locale: 'en',
    symbol: 'JD ',
    decimalDigits: 3,
  );

  static String format(num amount) => _format.format(amount);
}