import 'package:flutter/material.dart';
import 'package:quiz_application/app/common/values/styles/dimens.dart';

class AppTextStyle {
  const AppTextStyle._();

  static const TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _textStyleBold = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle text10BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize10,
  );

  static final TextStyle text16BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
  );

  static final TextStyle text18BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
  );

  static final TextStyle text10BlackW600 = _textStyleBold.copyWith(
    fontSize: Dimens.fontSize10,
  );

  static final TextStyle text18BlackW600 = _textStyleBold.copyWith(
    fontSize: Dimens.fontSize18,
  );
}
