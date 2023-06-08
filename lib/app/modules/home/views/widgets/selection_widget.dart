import 'package:flutter/material.dart';
import 'package:quiz_application/app/common/util/exports.dart';
import 'package:quiz_application/app/common/values/app_colors.dart';
import 'package:quiz_application/app/common/values/styles/app_text_style.dart';
import 'package:quiz_application/app/modules/home/views/widgets/exports.dart';

class SelectionWidget extends StatelessWidget {
  final String title;
  final bool selected;
  final Function()? onSelect;

  const SelectionWidget({
    Key? key,
    required this.title,
    this.selected = false,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: 28.borderRadius,
          border: Border.all(
            width: 2.w,
            color: selected ? AppColors.primaryRed : Colors.white,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.text16BlackW400.copyWith(
                  color: selected ? AppColors.primaryRed : Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SelectIcon(selected: selected),
          ],
        ),
      ),
    );
  }
}
