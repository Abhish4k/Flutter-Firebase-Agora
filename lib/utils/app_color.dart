import 'package:flutter/material.dart';

class AppColor {
  static const Color themeColor = Color(0xff3252E7);
  static const Color secondaryColor = Color(0xff02F4FB);
  static const Color transparentThemeColor = Color(0xffC0C4D1);
  static const Color primaryColor = Color(0xff2872EB);
  static const Color greenColor = Color(0xff94C353);
  static const Color darkBlueGradientColor = Color(0xff2B68E9);
  static const Color blueGradientColor = Color(0xff0DCDF6);
  static const Color redColor = Color(0xffdc3545);
  static const Color ternaryColor = Color(0xff1C9BF0);
  static const Color dialogStatusBarColor = Color(0xff00aecb);
  static const Color blueColor = Color(0xff004FC8);
  static const Color lightTextColor = Color(0xffAAB0C7);
  static const Color dotColor = Color(0xff404A74);
  static const Color textColor = Color(0xff848BA5);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xff555454);
  static const Color lightGrey = Color(0xffCACED7);
  static const Color lightGreyOne = Color(0xffDCDFE4);
  static const Color lightGreyTwo = Color(0xff7B7B7C);
  static const Color lightGreyThree = Color(0xffF8F8F8);
  static const Color lightGreyFour = Color(0xffB7BBCA);
  static const Color lightGreyFive = Color(0xff99BDE7);
  static const Color lightGreySix = Color(0xff6E7072);
  static const Color yellowEmojiColor = Color(0xffffae00);
  static const Color transparent = Color(0x00ffffff);
  static const Color greyGradiantOne = Color(0xffB2DBE7);
  static const Color greyGradiantTwo = Color(0xffB9C7E5);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [themeColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient blueGradient = LinearGradient(
    colors: [darkBlueGradientColor, AppColor.blueGradientColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient greyGradiant = LinearGradient(
    colors: [greyGradiantOne, greyGradiantTwo],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
