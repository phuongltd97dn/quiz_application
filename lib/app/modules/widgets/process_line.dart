import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProcessLine extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final Color backgroundColor;
  final double percent;

  const ProcessLine({
    Key? key,
    this.width,
    this.height,
    required this.color,
    required this.backgroundColor,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        return Stack(
          children: [
            Container(
              height: height ?? 10.h,
              width: width ?? 40.w,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(30)),
            ),
            Container(
              height: height ?? 10.h,
              width: width != null ? maxWidth * percent : 40.w * percent,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(30)),
            ),
          ],
        );
      },
    );
  }
}
