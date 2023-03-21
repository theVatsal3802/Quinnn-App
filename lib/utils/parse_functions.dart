class ParseFunctions {
  static String getMonthNameFromNumber(int monthNumber) {
    String monthName = "";
    switch (monthNumber) {
      case 1:
        monthName = "Jan";
        break;
      case 2:
        monthName = "Feb";
        break;
      case 3:
        monthName = "Mar";
        break;
      case 4:
        monthName = "Apr";
        break;
      case 5:
        monthName = "May";
        break;
      case 6:
        monthName = "June";
        break;
      case 7:
        monthName = "July";
        break;
      case 8:
        monthName = "Aug";
        break;
      case 9:
        monthName = "Sep";
        break;
      case 10:
        monthName = "Oct";
        break;
      case 11:
        monthName = "Nov";
        break;
      case 12:
        monthName = "Dec";
        break;
    }
    return monthName;
  }

  static String getDateFromDateTime({required DateTime date}) {
    String month = getMonthNameFromNumber(date.month);
    String minutes = date.minute.toString();
    if (minutes.length != 2) {
      minutes = "0$minutes";
    }
    return "${date.day} $month, ${date.year} at ${date.hour}:$minutes";
  }
}
