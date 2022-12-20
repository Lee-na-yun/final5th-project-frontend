import 'package:intl/intl.dart';

String parseTime(DateTime date) {
  return DateFormat("hh:mm").format(date);
}

String parseDate(DateTime date) {
  return DateFormat("yyyy-MM-dd").format(date);
}
