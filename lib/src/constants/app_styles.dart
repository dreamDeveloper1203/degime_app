import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color ColorPrimaryBlack = Color(0x0000000);
const Color ColorBlue = Colors.blue;

// Main Title Text
final TitleTextStyle = TextStyle(
    fontFamily: 'FamiljenGrotesk',
    fontWeight: FontWeight.bold,
    fontSize: 70.sp);

final MainTitle = TextStyle(
    fontWeight: FontWeight.w800, fontSize: 80.sp, color: Colors.black);

final NormalText = TextStyle(
    fontWeight: FontWeight.w400, fontSize: 50.sp, color: Colors.black);

final NormalLinkText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 50.sp,
    color: ColorBlue,
    decoration: TextDecoration.underline);

final SmallText = TextStyle(fontWeight: FontWeight.w400, fontSize: 40.sp);

// background

const kBgDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/main_background.png"),
    fit: BoxFit.fitWidth,
  ),
);
