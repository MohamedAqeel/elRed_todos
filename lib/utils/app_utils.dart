import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static void showToast(str) {
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  static String generateUID() {
    var uuid = const Uuid();
    return uuid.v1();
  }
}

extension DateFormatter on DateTime {
  String formatDate() {
    DateFormat fromatter = DateFormat("MMM d, yyyy");
    return fromatter.format(this);
  }

  String formatDateAndTime() {
    DateFormat fromatter = DateFormat("dd/MM/yyyy hh:mm aa");
    return fromatter.format(this);
  }
}
