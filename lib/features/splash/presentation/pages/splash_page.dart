import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    // debugPrint('🔥 Flutter SplashPage Loaded');
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Future ready tasks:
      // - Check auth token (SecureStorage)
      // - Load env config
      // - Preload user data
      // - Setup services

      await Future.delayed(const Duration(milliseconds: 800)); 
      // Small branding delay (optional)

      if (!mounted) return;

      // Navigate to home (or auth later)
      context.go('/login');
    } catch (e) {
      if (!mounted) return;
      context.go('/login'); // Fallback to login on error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // or background
      body: Center(
        child: Image(image: AssetImage( 'assets/images/doha-pride-logo.png'), width: 250,)
      ),
    );
  }
}