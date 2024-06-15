import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 24.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 24.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Stack(
          children: [
            Container(
              height: 1.v,
              width: 389.h,
              margin: EdgeInsets.only(
                left: 1.h,
                top: 39.11.v,
              ),
              decoration: BoxDecoration(
                color: appTheme.gray300,
              ),
            ),
            Container(
              height: 1.v,
              width: 389.h,
              margin: EdgeInsets.only(
                left: 1.h,
                top: 39.11.v,
              ),
              decoration: BoxDecoration(
                color: appTheme.gray300,
              ),
            ),
          ],
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill,
}
