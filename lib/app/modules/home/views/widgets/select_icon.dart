import 'package:flutter/material.dart';
import 'package:quiz_application/app/common/util/exports.dart';
import 'package:quiz_application/app/common/values/app_colors.dart';

class SelectIcon extends StatelessWidget {
  final bool selected;

  const SelectIcon({
    Key? key,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.w,
          color: selected ? AppColors.primaryRed : Colors.white,
        ),
      ),
      child: selected
          ? Icon(
              Icons.check,
              size: 18.w,
              color: AppColors.primaryRed,
            )
          : null,
    );
  }
}
