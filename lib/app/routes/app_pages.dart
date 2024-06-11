import 'package:get/get.dart';

import '../modules/absen/bindings/absen_binding.dart';
import '../modules/absen/views/absen_view.dart';
import '../modules/add_absen/bindings/add_absen_binding.dart';
import '../modules/add_absen/views/add_absen_view.dart';
import '../modules/add_product/bindings/add_product_binding.dart';
import '../modules/add_product/views/add_product_view.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/edit_absen/bindings/edit_absen_binding.dart';
import '../modules/edit_absen/views/edit_absen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homemain/bindings/homemain_binding.dart';
import '../modules/homemain/views/homemain_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/lupapass/bindings/lupapass_binding.dart';
import '../modules/lupapass/views/lupapass_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/telepon/bindings/telepon_binding.dart';
import '../modules/telepon/views/telepon_view.dart';
import '../modules/update_product/bindings/update_product_binding.dart';
import '../modules/update_product/views/update_product_view.dart';

// ignore_for_file: prefer_const_constructors, constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN; //ganti jdi splash

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.LUPAPASS,
      page: () => LupapassView(),
      binding: LupapassBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.TELEPON,
      page: () => TeleponView(),
      binding: TeleponBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PRODUCT,
      page: () => UpdateProductView(),
      binding: UpdateProductBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN,
      page: () => AbsenView(),
      binding: AbsenBinding(),
    ),
    GetPage(
      name: _Paths.HOMEMAIN,
      page: () => const HomemainView(),
      binding: HomemainBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ABSEN,
      page: () => const AddAbsenView(),
      binding: AddAbsenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ABSEN,
      page: () => const EditAbsenView(),
      binding: EditAbsenBinding(),
    ),
  ];
}
