import 'package:flutter/cupertino.dart';
import 'package:prayas_capital/core/utils/StringFile.dart';
import 'package:prayas_capital/widgets/TextView.dart';

Widget netPLAndTotalChargesWidget(
    {required String name, required String value}) {
  return Column(
    children: [
      TextView(text: name),
      TextView(text: "${MyString.rupeeSymbol} $value"),
    ],
  );
}
