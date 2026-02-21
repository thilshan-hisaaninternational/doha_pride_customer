import 'package:doha_pride_customer/core/router/app_router.dart';
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_theme.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_button.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  // bool get _isValid {
  //   return Validators.validateEmail(_emailController.text) == null &&
  //       Validators.validatePassword(_passwordController.text) == null;
  // }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    // if (mounted) {
    //   context.go(AppRouter.products);
    // }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {}),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image: AssetImage('assets/images/doha-pride-logo.png'),
                    width: 250,
                  ),
                ),
                // Logo or Icon
                // const Icon(Icons.shopping_cart, size: 80, color: Colors.indigo),
                // const SizedBox(height: AppSpacing.md),

                // Welcome Text
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  'Login to continue to Mini Mart',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: AppSpacing.xl),

                // Email field with icon
                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  // validator: Validators.validateEmail,
                ),
                const SizedBox(height: AppSpacing.md),

                // Password field with icon
                AppTextField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                  // validator: Validators.validatePassword,
                ),
                const SizedBox(height: AppSpacing.lg),

                // Login Button
                AppButton(
                  text: 'Login',
                  isLoading: _isLoading,
                  onPressed: _login,
                ),

                const SizedBox(height: AppSpacing.md),

                // Optional: Signup link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        // Navigate to signup page if you have one
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
