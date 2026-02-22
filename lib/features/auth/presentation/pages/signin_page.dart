import 'package:doha_pride_customer/core/router/app_router.dart';
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_icon_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_button.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  // bool get _isValid {
  //   return Validators.validateEmail(_emailController.text) == null &&
  //       Validators.validatePassword(_passwordController.text) == null;
  // }

  Future<void> _login() async {
    // dismiss keyboard first
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1)); // mock delay

    if (mounted) {
      setState(() => _isLoading = false);
      // context.go(AppRoutes.home); // uncomment when ready
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPadding,
              vertical: AppSpacing.lg,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppSpacing.xl),

                  // ── Logo ──────────────────────────────────────────
                  Center(
                    child: Image(
                      image: AssetImage('assets/images/doha-pride-logo.png'),
                      width: 180.w,
                    ),
                  ),

                  SizedBox(height: AppSpacing.xxl),

                  // ── Welcome Text ───────────────────────────────────
                  Text('Welcome Back!', style: AppTextStyles.heading1),
                  SizedBox(height: AppSpacing.xs),

                  Text(
                    'Sign in to your Doha Pride account',
                    // style: TextStyle(fontSize: 16, color: Colors.grey),
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),

                  SizedBox(height: AppSpacing.xl),

                  AppTextField(
                    controller: _emailController,
                    label: 'Email or Username',
                    prefixIcon: Icon(
                      // Icons.email_outlined,
                      Iconsax.user,
                      color: AppColors.textSecondary,
                      size: AppIconSizes.sm,
                    ),
                    keyboardType:
                        TextInputType.emailAddress, // 👈 right keyboard
                    textInputAction:
                        TextInputAction.next, // 👈 next on keyboard
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email or username';
                      }
                      // if (!RegExp(
                      //   r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      // ).hasMatch(value)) {
                      //   return 'Please enter a valid email';
                      // }
                      return null;
                    },
                  ),

                  SizedBox(height: AppSpacing.md),

                  AppTextField(
                    controller: _passwordController,
                    label: 'Password',
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done, //  done on keyboard
                    onFieldSubmitted: (_) => _login(), //  login on done press
                    prefixIcon: Icon(
                      Iconsax.lock,
                      color: AppColors.textSecondary,
                      // size: AppIconSizes.sm,
                    ),
                    suffixIcon: IconButton(
                      // 👈 show/hide password
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                      icon: Icon(
                        _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                        color: AppColors.textSecondary,
                        size: AppIconSizes.sm,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppSpacing.sm),

                  // ── Forgot Password ────────────────────────────────
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // context.push(AppRoutes.forgotPassword);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontSize: AppTextStyles.bodySmall.fontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: AppSpacing.xl),

                  // ── Login Button ───────────────────────────────────
                  AppButton(
                    text: 'Sign In',
                    isLoading: _isLoading,
                    onPressed: _login,
                  ),

                  SizedBox(height: AppSpacing.lg),

                  // ── Divider ────────────────────────────────────────
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                        ),
                        child: Text('or', style: AppTextStyles.bodySmall),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),

                  SizedBox(height: AppSpacing.lg),

                  // ── Sign Up Link ───────────────────────────────────
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go(AppRoutes.signUp),

                          child: Text(
                            'Sign Up',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSpacing.md),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
