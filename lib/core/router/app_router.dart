import 'package:doha_pride_customer/features/auth/presentation/pages/signin_page.dart';
import 'package:doha_pride_customer/features/auth/presentation/pages/signup_page.dart';
import 'package:doha_pride_customer/features/home/presentation/pages/home_page.dart';
import 'package:doha_pride_customer/features/home/presentation/pages/home_shell.dart';
import 'package:doha_pride_customer/features/my_bookings/presentation/pages/booking_tab_page.dart';
import 'package:doha_pride_customer/features/profile/presentation/pages/profile_tab_page.dart';
import 'package:doha_pride_customer/features/services/domain/service_type.dart';
import 'package:doha_pride_customer/features/services/presentation/pages/service_list_page.dart';
import 'package:doha_pride_customer/features/services/presentation/pages/services_tab_page.dart';
import 'package:doha_pride_customer/features/splash/presentation/pages/splash_page.dart';
import 'package:doha_pride_customer/features/transfers/presentation/pages/transfer_booking_options_page.dart';
import 'package:doha_pride_customer/features/transfers/presentation/pages/transfer_details_page.dart';
import 'package:doha_pride_customer/features/transfers/presentation/pages/transfer_passenger_details_page.dart';
import 'package:doha_pride_customer/features/transfers/presentation/pages/transfer_review_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      // Splash / Auth
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

      // ── Transfer booking flow (multi-step, outside bottom nav) ─────────────
      GoRoute(
        path: '/transfer/booking',
        name: 'transfer-booking-options',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return TransferBookingOptionsPage(
            title: extra['title'] as String? ?? '',
            imageUrl: extra['imageUrl'] as String? ?? '',
            fromPrice: extra['fromPrice'] as String? ?? '',
          );
        },
        routes: [
          GoRoute(
            path: 'passenger',
            name: 'transfer-booking-passenger',
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>? ?? {};
              return TransferPassengerDetailsPage(bookingData: extra);
            },
          ),
          GoRoute(
            path: 'review',
            name: 'transfer-booking-review',
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>? ?? {};
              return TransferReviewPage(bookingData: extra);
            },
          ),
        ],
      ),

      // ── Shell (bottom nav with 4 tabs) ─────────────────────────────────────
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
                builder: (context, state) => const ServicesTab(),
                routes: [
                  GoRoute(
                    path: 'listing',
                    name: 'service-listing',
                    builder: (context, state) {
                      final extra = state.extra as Map<String, dynamic>;
                      return ServiceListingPage(
                        title: extra['title'] as String,
                        items: extra['items'] as List<Map<String, dynamic>>,
                        serviceType: extra['serviceType'] as ServiceType,
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'transfer',
                        name: 'transfer-details',
                        builder: (context, state) {
                          final extra = state.extra as Map<String, dynamic>;
                          return TransferDetailsPage(
                            title: extra['title'] as String,
                            imageUrl: extra['imageUrl'] as String,
                            fromPrice: extra['fromPrice'] as String,
                          );
                        },
                      ),
                      GoRoute(
                        path: 'tour',
                        name: 'tour-details',
                        builder: (context, state) {
                          final extra = state.extra as Map<String, dynamic>;
                          return TransferDetailsPage(
                            title: extra['title'] as String,
                            imageUrl: extra['imageUrl'] as String,
                            fromPrice: extra['fromPrice'] as String,
                          );
                        },
                      ),
                      GoRoute(
                        path: 'transit',
                        name: 'transit-details',
                        builder: (context, state) {
                          final extra = state.extra as Map<String, dynamic>;
                          return TransferDetailsPage(
                            title: extra['title'] as String,
                            imageUrl: extra['imageUrl'] as String,
                            fromPrice: extra['fromPrice'] as String,
                          );
                        },
                      ),
                      GoRoute(
                        path: 'meet-greet',
                        name: 'meet-greet-details',
                        builder: (context, state) {
                          final extra = state.extra as Map<String, dynamic>;
                          return TransferDetailsPage(
                            title: extra['title'] as String,
                            imageUrl: extra['imageUrl'] as String,
                            fromPrice: extra['fromPrice'] as String,
                          );
                        },
                      ),
                      GoRoute(
                        path: 'hotel',
                        name: 'hotel-details',
                        builder: (context, state) {
                          final extra = state.extra as Map<String, dynamic>;
                          return TransferDetailsPage(
                            title: extra['title'] as String,
                            imageUrl: extra['imageUrl'] as String,
                            fromPrice: extra['fromPrice'] as String,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // Branch 2 — Bookings
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.bookings,
                builder: (context, state) => const BookingsTab(),
              ),
            ],
          ),

          // Branch 3 — Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileTab(),
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

  static const String splash = '/splash';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String home = '/home';
  static const String services = '/services';
  static const String bookings = '/bookings';
  static const String profile = '/profile';

  // These can be used later for dedicated services subroutes if needed
  static const String transfers = '/services/transfers';
  static const String meetGreet = '/services/meet-greet';
  static const String transitTours = '/services/transit-tours';
  static const String tripPackages = '/services/trip-packages';
  static const String hotelBooking = '/services/hotel-booking';
}
