// import 'package:doha_pride_customer/features/auth/presentation/pages/signin_page.dart';
// import 'package:doha_pride_customer/features/auth/presentation/pages/signup_page.dart';
// import 'package:doha_pride_customer/features/home/presentation/pages/home_page.dart';
// import 'package:doha_pride_customer/features/splash/presentation/pages/splash_page.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter/material.dart';

// class AppRouter {
//   static final GoRouter router = GoRouter(
//     initialLocation: AppRoutes.splash,
//     routes: [

//       // ── Auth Routes (no shell, no bottom nav) ──────────────────
//       GoRoute(
//         path: AppRoutes.splash,
//         builder: (context, state) => const HomePage(), // SplashPage()
//       ),
//       GoRoute(
//         path: AppRoutes.login,
//         builder: (context, state) => const SigninPage(), // SigninPage()
//       ),
//             GoRoute(
//         path: AppRoutes.signUp,
//         builder: (context, state) => const SignupPage(), // SignUpPage()
//       ),

//       // ── Shell (has bottom nav) ─────────────────────────────────

//       GoRoute(
//         path: AppRoutes.home,
//         builder: (context, state) => const HomePage(), // HomPage()
//       ),
//       GoRoute(
//         path: AppRoutes.transfers,
//         builder: (context, state) => const Placeholder(),
//       ),
//       GoRoute(
//         path: AppRoutes.meetGreet,
//         builder: (context, state) => const Placeholder(),
//       ),
//       GoRoute(
//         path: AppRoutes.transitTours,
//         builder: (context, state) => const Placeholder(),
//       ),
//       GoRoute(
//         path: AppRoutes.tripPackages,
//         builder: (context, state) => const Placeholder(),
//       ),
//       GoRoute(
//         path: AppRoutes.hotelBooking,
//         builder: (context, state) => const Placeholder(),
//       ),
//     ],
//   );
// }

// class AppRoutes {
//   AppRoutes._();

//   static const String splash        = '/';
//   static const String login         = '/login';
//   static const String signUp        = '/signup';
//   static const String home          = '/home';
//   static const String transfers     = '/transfers';
//   static const String meetGreet     = '/meet-greet';
//   static const String transitTours  = '/transit-tours';
//   static const String tripPackages  = '/trip-packages';
//   static const String hotelBooking  = '/hotel-booking';
// }


import 'package:doha_pride_customer/features/auth/presentation/pages/signin_page.dart';
import 'package:doha_pride_customer/features/auth/presentation/pages/signup_page.dart';
import 'package:doha_pride_customer/features/home/presentation/pages/home_page.dart';
import 'package:doha_pride_customer/features/home/presentation/pages/home_shell.dart';
import 'package:doha_pride_customer/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [

      // ── Auth Routes (no shell, no bottom nav) ──────────────────
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const SignupPage(),
      ),

      // ── Shell (has bottom nav) ─────────────────────────────────
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeShell(navigationShell: navigationShell);
        },
        branches: [

          // Branch 0 — Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),

          // Branch 1 — Services
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.services,
                builder: (context, state) => const HomePage(),
                routes: [
                  // nested service routes go here later
                  // GoRoute(path: 'transfers', ...)
                  // GoRoute(path: 'meet-greet', ...)
                ],
              ),
            ],
          ),

          // Branch 2 — Bookings
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.bookings,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),

          // Branch 3 — Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class AppRoutes {
  AppRoutes._();

  static const String splash       = '/splash';
  static const String login        = '/login';
  static const String signUp       = '/signup';
  static const String home         = '/home';
  static const String services     = '/services';
  static const String bookings     = '/bookings';
  static const String profile      = '/profile';

  // these will be nested under services later
  static const String transfers    = '/services/transfers';
  static const String meetGreet    = '/services/meet-greet';
  static const String transitTours = '/services/transit-tours';
  static const String tripPackages = '/services/trip-packages';
  static const String hotelBooking = '/services/hotel-booking';
}