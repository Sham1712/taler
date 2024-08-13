import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taler/object/billproduct.dart';

void route(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}

void routename(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

Widget hspace(double height) => SizedBox(
      height: height.h,
    );

Widget wspace(double width) => SizedBox(
      width: width.w,
    );

void goback(BuildContext context) {
  Navigator.pop(context);
}

const String ky_page = 'page';
const String ky_screen = 'screen';

void setscreens(int screen, int page) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setInt(ky_screen, screen);
  pref.setInt(ky_page, page);
}

Future<List<int>> get getscreens async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return [pref.getInt(ky_screen) ?? 0, pref.getInt(ky_page) ?? 1];
}

TValue? selectof<TOptionType, TValue>(
  TOptionType selectedOption,
  Map<TOptionType, TValue> branches, [
  TValue? defaultValue,
]) {
  if (!branches.containsKey(selectedOption)) {
    return defaultValue;
  }

  return branches[selectedOption];
}

double netamountof(Billproduct billpro) {
  return ((billpro.price * billpro.quantity) -
      ((billpro.price * billpro.quantity) * (billpro.dicountpercent / 100)));
}

String get timenow {
  return DateTime.now().toIso8601String();
}

String timeof(String iso) {
  return '${iso.substring(11, 13)}:${iso.substring(14, 16)},${iso.substring(17, 19)}';
}

String timedateof(DateTime now) {
  now.toIso8601String();
  return now.toIso8601String().substring(0, 12);
}

String getime(DateTime dateTime) {
  final DateTime now = DateTime.now();
  int min = now.difference(dateTime).inMinutes;
  int hour = now.difference(dateTime).inHours;
  int day = now.difference(dateTime).inDays;
  if (min < 2) {
    return 'Just now';
  } else if (min < 61) {
    return '$min mins ago';
  } else if (hour < 25) {
    return '$hour hours ago';
  } else if (day < 5) {
    return '$day days ago';
  } else {
    return '${dateTime.hour}:${dateTime.minute} ${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
