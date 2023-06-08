import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz_application/app/common/util/exports.dart';
import 'package:quiz_application/app/common/values/app_colors.dart';
import 'package:quiz_application/app/modules/widgets/process_line.dart';

class AppImages {
  const AppImages._();

  static Widget svgUrl(String name,
      {Color? color,
      double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      bool circle = false,
      Widget? placeholderWidget,
      Map<String, String>? header,
      EdgeInsets padding = const EdgeInsets.all(6.0)}) {
    return Padding(
      padding: padding,
      child: SvgPicture.network(
        name,
        color: color,
        placeholderBuilder: (context) => placeholderWidget ?? Container(),
        width: width,
        height: height,
        fit: fit,
        headers: header,
      ),
    );
  }

  static Widget imgNetWorking(
    String url, {
    BorderRadiusGeometry? borderRadius,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: url,
        memCacheHeight: toInt(height),
        memCacheWidth: toInt(width),
        progressIndicatorBuilder: (context, text, value) {
          return Center(
            child: ProcessLine(
                color: AppColors.primaryColor,
                backgroundColor: AppColors.primaryColor.withOpacity(0.4),
                percent: value.progress ?? 0),
          );
        },
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: 22.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  //home
  static const String medal = 'assets/images/medal.svg';
  static const String refresh = 'assets/images/refresh.svg';
}
