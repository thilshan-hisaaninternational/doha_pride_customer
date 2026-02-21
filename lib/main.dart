import 'package:doha_pride_customer/core/router/app_router.dart';
import 'package:doha_pride_customer/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart' as di ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();
  runApp(const DohaprideApp());
}

class DohaprideApp extends StatelessWidget {
  const DohaprideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Doha Pride",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}


