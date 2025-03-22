import 'package:intl/intl.dart';
import 'package:islaami/model/time_response_model.dart';

class dateForMatter {
  static String formarGregorian(Gregorian date) {
    return '${date.day} ${date.month.en.substring(0, 3)} \n ${date.year}';
  }

  static String formarhajri(Hijri date) {
    return '${date.day} ${date.month.en.substring(0, 3)} \n ${date.year}';
  }
}

class timeConverter {
  static String to12hour(String time) {
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    return DateFormat('hh:mm a').format(dateTime);
  }
}
