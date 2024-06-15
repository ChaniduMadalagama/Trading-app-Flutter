import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeManropeOnErrorContainer =>
      theme.textTheme.bodyLarge!.manrope.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumManropeBluegray700 =>
      theme.textTheme.bodyMedium!.manrope.copyWith(
        color: appTheme.blueGray700,
        fontSize: 14.fSize,
      );
  static get bodyMediumRedA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.redA700,
      );
  static get bodyMediumSFProDisplayBluegray700 =>
      theme.textTheme.bodyMedium!.sFProDisplay.copyWith(
        color: appTheme.blueGray700,
        fontSize: 14.fSize,
      );
  static get bodyMediumSFProDisplaySecondaryContainer =>
      theme.textTheme.bodyMedium!.sFProDisplay.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 14.fSize,
      );
  static get bodySmallGray700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray700,
        fontSize: 9.fSize,
      );
  static get bodySmallRedA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.redA700,
        fontSize: 9.fSize,
      );
  // Headline text style
  static get headlineSmallManropeOnPrimary =>
      theme.textTheme.headlineSmall!.manrope.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w800,
      );
  // Label text style
  static get labelLargeSFProTextWhiteA700 =>
      theme.textTheme.labelLarge!.sFProText.copyWith(
        color: appTheme.whiteA700,
        fontSize: 13.fSize,
      );
  static get labelLargeff4e4e4e => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF4E4E4E),
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumManropeOnErrorContainer =>
      theme.textTheme.labelMedium!.manrope.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(0.53),
        fontSize: 11.fSize,
      );
  // Title text style
  static get titleLargeManropeGray400 =>
      theme.textTheme.titleLarge!.manrope.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeManropeOnErrorContainer =>
      theme.textTheme.titleLarge!.manrope.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumBluegray700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray700,
      );
  static get titleMediumCircularStdGray800 =>
      theme.textTheme.titleMedium!.circularStd.copyWith(
        color: appTheme.gray800,
      );
  static get titleMediumGray400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumGray800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOnErrorContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOnErrorContainerBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w800,
      );
  static get titleMedium_1 => theme.textTheme.titleMedium!;
  static get titleMediumff01031c => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF01031C),
      );
  static get titleMediumff4e4e4e => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF4E4E4E),
      );
  static get titleMediumffff7a00 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFFFF7A00),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallGray70001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray70001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGreenA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.greenA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallOnErrorContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallOnErrorContainerBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(0.53),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPink500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.pink500,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallff4e4e4e => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF4E4E4E),
      );
  static get titleSmallff4e4e4e15 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF4E4E4E),
        fontSize: 15.fSize,
      );
}

extension on TextStyle {
  TextStyle get manrope {
    return copyWith(
      fontFamily: 'Manrope',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get circularStd {
    return copyWith(
      fontFamily: 'Circular Std',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }
}
