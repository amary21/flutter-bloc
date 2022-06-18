import 'package:intl/intl.dart';

String dateFormat(String date){
  var oldFormat = DateFormat("yyyy-MM-dd");
  var oldInput = oldFormat.parse(date);
  var newFormat = DateFormat("dd MMMM, yyyy");
  var newInput = newFormat.format(oldInput);
  return newInput;
}