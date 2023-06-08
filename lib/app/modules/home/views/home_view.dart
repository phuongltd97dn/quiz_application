import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_application/app/common/values/app_colors.dart';
import 'package:quiz_application/app/common/values/strings.dart';
import 'package:quiz_application/app/common/values/styles/app_text_style.dart';
import 'package:quiz_application/app/modules/home/controllers/home_controller.dart';
import 'package:quiz_application/app/modules/home/views/widgets/exports.dart';
import 'package:quiz_application/app/modules/widgets/exports.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: const SizedBox.shrink(),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.close,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: controller.obx(
        (state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${Strings.question} ${controller.currentIndex.value + 1}/${state?.length}',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.text18BlackW600.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 48.h),
                  Text(
                    controller.currentQuestion.value?.question ?? '',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.text18BlackW400.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 48.h),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.currentAnswers.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final answer = controller.currentAnswers[index];

                      return SelectionWidget(
                        title: answer,
                        selected: controller.selectedAnswer.value == answer,
                        onSelect: () => controller.onAnswerSelected(answer),
                      );
                    },
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.w),
                    child: CustomButton(
                      isBorder: false,
                      isDisable: controller.selectedAnswer.value.isEmpty,
                      title: controller.currentIndex.value + 1 <
                              (state?.length ?? 0)
                          ? Strings.next
                          : Strings.submit,
                      onPressed: () => controller.onNextPressed(),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        onLoading: const Center(
          child: CupertinoActivityIndicator(color: Colors.white),
        ),
        onEmpty: const Center(child: Text(Strings.emptyQuiz)),
        onError: (error) => Center(
          child: Text(error ?? Strings.somethingWentWrong),
        ),
      ),
    );
  }
}
