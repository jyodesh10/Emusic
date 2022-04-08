import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/adminpanel/bindings/adminpanel_binding.dart';
import '../modules/adminpanel/views/adminpanel_view.dart';
import '../modules/artist/bindings/artist_binding.dart';
import '../modules/artist/views/artist_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/merchstore/bindings/merchstore_binding.dart';
import '../modules/merchstore/views/merchstore_view.dart';
import '../modules/nowplaying/bindings/nowplaying_binding.dart';
import '../modules/nowplaying/views/nowplaying_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/subscription/bindings/subscription_binding.dart';
import '../modules/subscription/views/subscription_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

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
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.ARTIST,
    //   page: () => ArtistView(),
    //   binding: ArtistBinding(),
    // ),
    GetPage(
      name: _Paths.MERCHSTORE,
      page: () => MerchstoreView(),
      binding: MerchstoreBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () => SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    // GetPage(
    //   name: _Paths.NOWPLAYING,
    //   page: () => NowplayingView(),
    //   binding: NowplayingBinding(),
    // ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.ADMINPANEL,
      page: () => AdminpanelView(),
      binding: AdminpanelBinding(),
    ),
  ];
}
