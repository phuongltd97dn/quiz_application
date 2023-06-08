import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_application/app/common/values/app_colors.dart';
import 'package:quiz_application/app/common/values/app_images.dart';
import 'package:quiz_application/app/common/values/strings.dart';
import 'package:quiz_application/app/modules/widgets/exports.dart';
import 'package:quiz_application/app/routes/app_pages.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImages.imgNetWorking(
              "https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/fce5c8300aee85522cfb06edfba764b6.png",
              width: 80.w,
              height: 80.h,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            SizedBox(height: 16.h),
            CustomButton(
              isBorder: false,
              isDisable: false,
              title: Strings.startQuiz,
              onPressed: () => Get.toNamed(
                Routes.home,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
