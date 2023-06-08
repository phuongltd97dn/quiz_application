import 'package:get/get.dart';
import 'package:quiz_application/app/modules/home/bindings/home_binding.dart';
import 'package:quiz_application/app/modules/home/views/home_view.dart';
import 'package:quiz_application/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:quiz_application/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
