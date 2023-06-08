import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_application/app/data/interface_controller/api_interface_controller.dart';
import 'package:quiz_application/app/data/repository/api_helper.dart';
import 'package:quiz_application/app/data/repository/api_helper_impl.dart';
import 'package:timezone/data/latest.dart' as tz;

class Initializer {
  static const Initializer instance = Initializer._internal();
  factory Initializer() => instance;
  const Initializer._internal();

  void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return const SizedBox();
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await _initServices();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        printInfo(info: details.stack.toString());
      };

      runApp.call();
    }, (error, stack) {
      printInfo(info: 'runZonedGuarded: ${error.toString()}');
    });
    tz.initializeTimeZones();
  }

  Future<void> _initServices() async {
    try {
      await _initStorage();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> _initStorage() async {
    await GetStorage.init();
  }

  void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiHelper>(
      ApiHelperImpl(),
    );

    Get.put<ApiInterfaceController>(
      ApiInterfaceController(),
    );
  }
}
