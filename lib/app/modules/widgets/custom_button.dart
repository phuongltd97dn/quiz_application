import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_application/app/common/util/extensions.dart';
import 'package:quiz_application/app/common/values/app_colors.dart';
import 'package:quiz_application/app/common/values/styles/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final Widget? child;
  final bool isBorder;
  final bool isDisable;

  const CustomButton({
    Key? key,
    this.title,
    this.width,
    this.height,
    this.onPressed,
    this.child,
    required this.isBorder,
    required this.isDisable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 48.h,
      decoration: BoxDecoration(
        color: AppColors.primaryRed,
        borderRadius: 28.borderRadius,
      ),
      child: ElevatedButton(
        onPressed: isDisable ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: AppColors.primaryGray,
          shape: RoundedRectangleBorder(
            borderRadius: 28.borderRadius,
            side: isBorder
                ? BorderSide(color: Colors.black, width: 1.w)
                : BorderSide.none,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: child ??
              Text(
                title ?? "",
                style:
                    AppTextStyle.text18BlackW600.copyWith(color: Colors.white),
              ),
        ),
      ),
    );
  }
}
