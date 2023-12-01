import 'package:flutter/material.dart';
import 'package:degime_app/src/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body style
  static get bodyLargePoppins => theme.textTheme.bodyLarge!.poppins;
  static get bodyLargePoppinsDeeppurpleA20001 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.deepPurpleA20001,
      );
  static get bodyLargePoppinsDeeppurpleA40001 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.deepPurpleA40001,
      );
  static get bodyLargePoppinsGray800 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.gray800,
        fontSize: 18.fSize,
      );
  static get bodyLargePoppinsOnErrorContainer =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  static get bodyLargePoppinsOnPrimary =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 18.fSize,
      );
  static get bodyLargePoppins_1 => theme.textTheme.bodyLarge!.poppins;
  static get bodyLargeRoboto => theme.textTheme.bodyLarge!.roboto.copyWith(
        fontSize: 17.fSize,
      );
  static get bodyLargeSFProTextLightblueA70001 =>
      theme.textTheme.bodyLarge!.sFProText.copyWith(
        color: appTheme.lightBlueA70001,
      );
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumBluegray40001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray40001,
        fontSize: 14.fSize,
      );
  static get bodyMediumBluegray4000114 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray40001,
        fontSize: 14.fSize,
      );
  static get bodyMediumBluegray800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray800,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumInterOnPrimary =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 14.fSize,
      );
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get bodyMediumOnPrimary13 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(0.42),
        fontSize: 13.fSize,
      );
  static get bodyMediumOnPrimary14 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 14.fSize,
      );
  static get bodyMediumOnPrimaryLight => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 13.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPoppinsOnErrorContainer =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 13.fSize,
      );
  static get bodyMediumPoppinsOnPrimary =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 11.fSize,
      );
  static get bodySmallFamiljenGroteskBlack900 =>
      theme.textTheme.bodySmall!.familjenGrotesk.copyWith(
        color: appTheme.black900,
      );
  static get bodySmallFamiljenGroteskBlack90012 =>
      theme.textTheme.bodySmall!.familjenGrotesk.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get bodySmallInterBlack900 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.3),
      );
  static get bodySmallInterBlack900_1 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.46),
      );
  static get bodySmallInterOnPrimary =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 8.fSize,
      );
  static get bodySmallInterPrimaryContainer =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 11.fSize,
      );
  static get bodySmallOnPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 12.fSize,
      );
  static get bodySmallOnPrimary12 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 12.fSize,
      );
  static get bodySmallOnPrimaryLight => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w300,
      );
  static get bodySmallOnPrimaryLight12 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallPoppinsBlack900 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsBlack90012 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsBlack9009 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 9.fSize,
      );
  static get bodySmallPoppinsDeeppurpleA40001 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.deepPurpleA40001,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsErrorContainer =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallPoppinsOnErrorContainer =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 12.fSize,
      );
  // Familjen text style
  static get familjenGroteskBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w400,
      ).familjenGrotesk;
  // Headline text style
  static get headlineLarge31 => theme.textTheme.headlineLarge!.copyWith(
        fontSize: 31.fSize,
      );
  // Inter text style
  static get interOnPrimary => TextStyle(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 5.fSize,
        fontWeight: FontWeight.w400,
      ).inter;
  // Label text style
  static get labelLargeGray400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray400,
      );
  static get labelLargePoppinsGray50002 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.gray50002,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargePoppinsGray700 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.gray700,
      );
  static get labelLargeRedA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.redA700,
      );
  static get labelMediumGray50002 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray50002,
      );
  // Title text style
  static get titleLargeFamiljenGroteskBlack900 =>
      theme.textTheme.titleLarge!.familjenGrotesk.copyWith(
        color: appTheme.black900,
        fontSize: 22.fSize,
      );
  static get titleLargeFamiljenGroteskBlack900Regular =>
      theme.textTheme.titleLarge!.familjenGrotesk.copyWith(
        color: appTheme.black900,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeRobotoBlack900 =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w400,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumFamiljenGrotesk =>
      theme.textTheme.titleMedium!.familjenGrotesk;
  static get titleMediumFamiljenGroteskBlack900 =>
      theme.textTheme.titleMedium!.familjenGrotesk.copyWith(
        color: appTheme.black900.withOpacity(0.3),
      );
  static get titleMediumFamiljenGroteskBlack900Left =>
      theme.textTheme.titleMedium!.familjenGrotesk.copyWith(
        color: appTheme.black900.withOpacity(0.3),
      );
  static get titleMediumFamiljenGroteskBlack900_1 =>
      theme.textTheme.titleMedium!.familjenGrotesk.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumFamiljenGroteskDeeppurpleA20001 =>
      theme.textTheme.titleMedium!.familjenGrotesk.copyWith(
        color: appTheme.deepPurpleA20001,
      );
  static get titleMediumFamiljenGroteskGray70002 =>
      theme.textTheme.titleMedium!.familjenGrotesk.copyWith(
        color: appTheme.gray70002,
      );
  static get titleMediumFamiljenGroteskOnPrimary =>
      theme.textTheme.titleMedium!.familjenGrotesk.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 18.fSize,
      );
  static get titleMediumFamiljenGroteskRedA700 =>
      theme.textTheme.titleMedium!.familjenGrotesk.copyWith(
        color: appTheme.redA700,
      );
  static get titleMediumPoppinsBlack900 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumPoppinsDeeppurpleA20001 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.deepPurpleA20001,
      );
  static get titleMediumPoppinsGray700 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray700,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallPoppinsBlack900 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
      );
  static get titleSmallPoppinsBluegray100 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray100,
        fontSize: 15.fSize,
      );
  static get titleSmallPoppinsGray700 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray700.withOpacity(0.6),
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get familjenGrotesk {
    return copyWith(
      fontFamily: 'Familjen Grotesk',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
