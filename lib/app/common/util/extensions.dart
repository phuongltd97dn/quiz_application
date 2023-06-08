import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_application/app/common/constants.dart';
import 'package:quiz_application/app/common/values/strings.dart';
import 'package:quiz_application/app/data/errors/api_error.dart';
import 'package:quiz_application/app/data/interface_controller/api_interface_controller.dart';
import 'package:quiz_application/app/routes/app_pages.dart';

import 'exports.dart';

class Extensions {}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(r);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );

  BorderSide borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
  }) =>
      BorderSide(
        color: color ?? Colors.white,
        width: 0.5,
        style: style ?? BorderStyle.solid,
      );
}

extension FutureExt<T> on Future<Response<T>?> {
  void futureValue(
    Function(T value) response, {
    required Function(String? error)? onError,
  }) {
    final interface = Get.find<ApiInterfaceController>();
    interface.error = null;

    timeout(
      Constants.timeout,
      onTimeout: () {
        Utils.closeDialog();

        Utils.showSnackbar(Strings.connectionTimeout);

        throw ApiError(
          type: ErrorType.connectTimeout,
          error: Strings.connectionTimeout,
        );
      },
    ).then((value) {
      if (value?.body != null) {
        Utils.closeDialog();
        response(value!.body as T);
      }
      interface.update();
    }).catchError((e) {
      if (e == null) return;
      String errorMessage = "";
      if (e is ApiError) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }

      if (e is ApiError) {
        if ((e.type == ErrorType.connectTimeout ||
            e.type == ErrorType.noConnection)) {
          interface.error = e;
        } else {
          Utils.showDialog(
            errorMessage,
            onTap: errorMessage != Strings.unauthorize
                ? null
                : () {
                    Storage.clearStorage();
                    Get.offAllNamed(
                      Routes.welcome,
                      //change the ROUTE to the LOGIN or SPLASH screen so that the
                      //user can login again on UnauthorizeError error
                    );
                  },
          );
        }
      }

      if (onError != null) {
        onError(errorMessage);
      }

      printError(info: 'catchError: error: $e\nerrorMessage: $errorMessage');
    });
  }
}
