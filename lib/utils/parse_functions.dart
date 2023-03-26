import 'package:flutter/material.dart';

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

  static String getDateFromDateTime({
    required DateTime date,
    required bool isTimeNeeded,
  }) {
    String month = getMonthNameFromNumber(date.month);
    String minutes = date.minute.toString();
    if (minutes.length != 2) {
      minutes = "0$minutes";
    }
    return isTimeNeeded
        ? "${date.day} $month, ${date.year} at ${date.hour}:$minutes"
        : "${date.day} $month, ${date.year}";
  }

  static String setPrecision({
    required String number,
  }) {
    if (number.length < 2) {
      return "0$number";
    }
    return number;
  }

  static void showSnackbar({
    required BuildContext context,
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textScaleFactor: 1,
        ),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
        ),
      ),
    );
  }

  static void addComment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add Comment to this post",
                    textScaleFactor: 1,
                    style: Theme.of(context).textTheme.bodyLarge),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Type your comment here",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Add Comment",
                    textScaleFactor: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
