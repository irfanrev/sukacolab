import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/project/bindings/project_binding.dart';
import '../modules/project/views/project_view.dart';
import '../modules/project_detail/bindings/project_detail_binding.dart';
import '../modules/project_detail/views/project_detail_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PROJECT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT,
      page: () => const ProjectView(),
      binding: ProjectBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAIL,
      page: () => const ProjectDetailView(),
      binding: ProjectDetailBinding(),
    ),
  ];
}
