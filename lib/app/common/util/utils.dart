import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_application/app/common/util/exports.dart';
import 'package:quiz_application/app/common/values/app_images.dart';
import 'package:quiz_application/app/common/values/strings.dart';
import 'package:quiz_application/app/common/values/styles/app_text_style.dart';
import 'package:quiz_application/app/common/values/styles/dimens.dart';
import 'package:quiz_application/app/modules/widgets/custom_button.dart';

class Utils {
  const Utils._();

  static void showDialog(
    String? message, {
    String title = Strings.error,
    bool success = false,
    VoidCallback? onTap,
  }) =>
      Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: () async {
          Get.back();

          onTap?.call();

          return true;
        },
        title: success ? Strings.success : title,
        content: Text(
          message ?? Strings.somethingWentWrong,
          textAlign: TextAlign.center,
          maxLines: 6,
          style: AppTextStyle.semiBoldStyle.copyWith(
            fontSize: Dimens.fontSize16,
          ),
        ),
        confirm: const Align(
          alignment: Alignment.centerRight,
          child: SizedBox(width: 0.0, height: 0.0),
        ),
      );

  static void showCustomDialog({
    String? icon,
    required String title,
    required String subtitle,
    required String result,
    Function()? onPlayAgain,
  }) =>
      Get.defaultDialog(
        barrierDismissible: false,
        radius: 12,
        contentPadding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        title: '',
        content: Column(
          children: [
            SvgPicture.asset(
              icon ?? AppImages.medal,
              width: 48.w,
              height: 48.h,
            ),
            SizedBox(height: 12.h),
            Text(title, style: AppTextStyle.text18BlackW600),
            SizedBox(height: 8.h),
            Text(subtitle),
            SizedBox(height: 8.h),
            Text(result),
          ],
        ),
        confirm: CustomButton(
          isBorder: false,
          isDisable: false,
          title: Strings.playAgain,
          onPressed: onPlayAgain,
        ),
      );

  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  static void showSnackbar(String? message) {
    closeSnackbar();

    Get.rawSnackbar(message: message);
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }
}
