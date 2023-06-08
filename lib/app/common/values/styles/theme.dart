import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_application/app/common/util/extensions.dart';
import 'package:quiz_application/app/common/values/app_colors.dart';
import 'package:quiz_application/app/common/values/styles/app_text_style.dart';
import 'package:quiz_application/app/common/values/styles/dimens.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get theme {
    final inputBorder = 20.outlineInputBorder(
      borderSide: 3.borderSide(),
    );

    final hintStyle = AppTextStyle.semiBoldStyle.copyWith(
      color: Colors.black,
      fontSize: Dimens.fontSize18,
    );

    return ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "SF-Pro",
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryColor,
          height: 45.h,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: 8.borderRadius,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
              (_) => EdgeInsets.zero,
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white.withOpacity(.14);
                }

                return null;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (_) => AppTextStyle.semiBoldStyle,
            ),
            shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
              (states) => RoundedRectangleBorder(
                borderRadius: 8.borderRadius,
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.primaryColor;
                }
                return null;
              },
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
              (_) => EdgeInsets.zero,
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white.withOpacity(.14);
                }

                return null;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (_) => AppTextStyle.semiBoldStyle,
            ),
            shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
              (states) => RoundedRectangleBorder(
                borderRadius: 8.borderRadius,
              ),
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 4,
          backgroundColor: AppColors.primaryColor,
        ),
        textTheme: TextTheme(
          titleMedium: AppTextStyle.text10BlackW400.copyWith(
            color: Colors.black,
            fontSize: Dimens.fontSize14,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 3,
          ),
          enabledBorder: inputBorder,
          disabledBorder: inputBorder,
          focusedBorder: inputBorder,
          border: inputBorder,
        ),
        cardTheme: CardTheme(
          color: Colors.white.withOpacity(0.85),
          shape: RoundedRectangleBorder(
            borderRadius: 8.borderRadius,
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: 8.borderRadius,
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23.r),
              topRight: Radius.circular(23.r),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color.fromARGB(255, 202, 157, 160),
            primarySwatch: Colors.red,
            primaryColorDark: Colors.red));
  }
}
