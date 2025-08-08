import 'package:intl/intl.dart';
extension DateParsing on String {
  DateTime toDateTime() {
    return DateTime.parse(this).toLocal();
  }
}

extension DateFormatting on DateTime {
  String toReadableString() {
    final dateFmt = DateFormat('dd MMM yyyy, hh:mm a');
    return dateFmt.format(this);
  }
}
extension DateOnlyFormatting on DateTime {
  String toDateString({String pattern = 'dd MMM yyyy'}) {
    return DateFormat(pattern).format(this);
  }
}

