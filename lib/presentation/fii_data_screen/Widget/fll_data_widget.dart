import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

import '../../../core/utils/ColorFile.dart';
import '../../../widgets/TextView.dart';

Widget FllDataButtonWidget({context ,required String title , required VoidCallback onTap}){
  return Card(
    elevation: 10,
    color: AppColors.white,
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(text: title,textSize: 14.h,textColor: AppColors.black),
            Icon(Icons.arrow_forward_ios,color: AppColors.black,)
          ],
        ),
      ),
    ),
  );
}