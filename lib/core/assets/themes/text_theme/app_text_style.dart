//ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

const _fontFamily = 'SchibstedGrotesk';

/// App text style.
enum AppTextStyle {
  regular11(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w400,
    ),
  ),
  regular14(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
  regular16(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  semibold15(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  ),
  bold10(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w700,
    ),
  ),
  bold12(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
  ),
  bold14(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  ),
  bold16(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
  bold18(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  ),
  bold22(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
  ),
  bold24(
    TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
