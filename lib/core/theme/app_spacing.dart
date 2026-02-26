import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  AppSpacing._(); // Private constructor to prevent instantiation

  static double get xs => 4.h;
  static double get s => 6.h;
  static double get sm => 8.h;
  static double get md => 16.h;
  static double get lg => 24.h;
  static double get xl => 32.h;
  static double get xxl => 48.h;

  // horizontal padding for all screens
  static double get screenPadding => 20.w;
  static double get screenPaddingsm => 4.w;

  // bottom padding for all screens
  static double get bottomPadding => 30.h;
}
