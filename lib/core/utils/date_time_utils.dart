import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String DD_MM_YYYY = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  /// Return a string representing [dateStartForcus] formatted according to our locale
  String format([String pattern = DD_MM_YYYY, String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  //dd-MM-yyyy HH:mm -> yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
  static String formatDateTimeTZ(String date, {String pattern = "dd-MM-yyyy HH:mm"}) {
    try {
      DateTime temp = DateFormat(pattern).parse(date);
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(temp); 
    } on FormatException {
      return date;
    }
  }
  //dd-MM-yyyy HH:mm -> yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
  static String formatDateTimeTZ2(String date) {
    try {
      DateTime temp = DateFormat("yyyy-MM-dd HH:mm").parse(date);
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(temp);
    } on FormatException {
      return date;
    }
  }

  //yyyy-MM-dd'T'HH:mm:ss'Z' -> dd-MM-yyyy HH:mm
  static String formatTZDateTime(String date) {
    try {
      DateTime temp = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(date);
      return DateFormat("dd-MM-yyyy HH:mm").format(temp);
    } on FormatException {
      return 'Lỗi định dạng ngày tháng';
    }
  }

  //yyyy-MM-dd'T'HH:mm:ss.SSS'Z' -> dd-MM-yyyy HH:mm
  static String formatTZDateTimeSSS(String date) {
    try {
      DateTime temp = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
      return DateFormat("dd-MM-yyyy HH:mm").format(temp);
    } on FormatException {
      return formatTZDateTime(date);
    }
  }
  //dd-MM-yyyy HH:mm -> yyyy-MM-dd'T'HH:mm:ss'Z'
  static String formatNormalTimeToTZTime(String date) {
    try {
      DateTime temp = DateFormat("dd-MM-yyyy HH:mm").parse(date);
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(temp);
    } on FormatException {
      return date;
    }
  }

  //convert yyyy-MM-dd'T'HH:mm:ss.SSS'Z' to DateTime
  static DateTime convertStringToDateTimeTZSSS(String date) {
    try {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    } on FormatException {
      return convertStringToDateTimeTZss(date);
    }
  }

  //convert yyyy-MM-dd'T'HH:mm:ss'Z' to DateTime
  static DateTime convertStringToDateTimeTZss(String date) {
    try {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(date);
    } on FormatException {
      return DateTime.now();
    }
  }
  
  
  static DateTime convertStringToDateTime(String date) {
    try {
      return DateFormat("dd-MM-yyyy HH:mm").parse(date);
    } on FormatException {
      return DateTime.now();
    }
  }

  //convert 2022-12-15 00:00:00.000 DateTime to 2022-12-15 DateTime
  static DateTime convertDateTimeToDateTime(DateTime date) {
    try {
      return DateFormat("yyyy-MM-dd").parse(DateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(date));
    } on FormatException {
      return DateTime.now();
    }
  }


  //convert String to DateTime
  static DateTime convertStringToDateTimeNormal(String date) {
    try {
      return DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(date);
    } on FormatException {
      return DateTime.now();
    }
  }  

}
