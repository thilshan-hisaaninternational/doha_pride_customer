import 'package:doha_pride_customer/features/auth/presentation/pages/login_page.dart';
import 'package:doha_pride_customer/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const LoginPage(), // SplashPage()
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(), // LoginPage()
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const Placeholder(), // HomePage()
      ),
      GoRoute(
        path: AppRoutes.transfers,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: AppRoutes.meetGreet,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: AppRoutes.transitTours,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: AppRoutes.tripPackages,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: AppRoutes.hotelBooking,
        builder: (context, state) => const Placeholder(),
      ),
    ],
  );
}

class AppRoutes {
  AppRoutes._();

  static const String splash        = '/';
  static const String login         = '/login';
  static const String home          = '/home';
  static const String transfers     = '/transfers';
  static const String meetGreet     = '/meet-greet';
  static const String transitTours  = '/transit-tours';
  static const String tripPackages  = '/trip-packages';
  static const String hotelBooking  = '/hotel-booking';
}