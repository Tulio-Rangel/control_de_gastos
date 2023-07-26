// Convert DateTime object to a string yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  // Year in format -> yyyy
  String year = dateTime.year.toString();

  // Month in format -> mm
  String month = dateTime.month.toString();

  // Day format -> dd
  String day = dateTime.day.toString();

  // Final format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
