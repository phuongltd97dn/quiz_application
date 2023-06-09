import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_application/app/data/errors/api_error.dart';

class ApiInterfaceController extends GetxController {
  ApiError? error;
  VoidCallback? retry;

  void onRetryTap() {
    error = null;
    retry?.call();
    update();
  }
}
