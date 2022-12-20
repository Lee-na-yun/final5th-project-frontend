import 'package:intl/intl.dart';

String parseTime(DateTime date) {
  return DateFormat("hh:mm").format(date);
}
