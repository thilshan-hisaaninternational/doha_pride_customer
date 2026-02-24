import 'package:doha_pride_customer/core/router/app_router.dart';
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_icon_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_button.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _googleLoading = false;
  bool _appleLoading = false;

  // prevents tapping another social button while one is loading
  bool get _anySocialLoading => _googleLoading || _appleLoading;

  // bool get _isValid {
  //   return Validators.validateEmail(_emailController.text) == null &&
  //       Validators.validatePassword(_passwordController.text) == null;
  // }

  // ── Auth Methods ─────────────────────────────────────────────

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

  Future<void> _googleSignIn() async {
    if (_anySocialLoading) return;
    setState(() => _googleLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() => _googleLoading = false);
      context.go(AppRoutes.home);
    }
  }

  Future<void> _appleSignIn() async {
    if (_anySocialLoading) return;
    setState(() => _appleLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() => _appleLoading = false);
      context.go(AppRoutes.home);
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    // ── Top flexible space ──────────────────────
                    SizedBox(height: AppSpacing.lg),

                    // ── Logo ──────────────────────────────────────────
                    Center(
                      child: Image(
                        image: AssetImage('assets/images/doha-pride-logo.png'),
                        width: 120.w,
                      ),
                    ),
                    SizedBox(height: AppSpacing.md),

                    // ── 2. Heading + Subtitle TOGETHER ─────────────
                    Text('Welcome Back!', style: AppTextStyles.heading2),
                    SizedBox(height: AppSpacing.xs),

                    Text(
                      'Sign in to your Doha Pride account',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),

                    SizedBox(height: AppSpacing.lg),

                    // ── 3. Social Buttons FIRST ──────────────────
                    _buildSocialButtons(),

                    SizedBox(height: AppSpacing.lg),

                    // // ── 4. Divider ───────────────────────────────
                    _buildDivider(),

                    SizedBox(height: AppSpacing.lg),

                    Text(
                      'Sign in to your Doha Pride account',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),

                    SizedBox(height: AppSpacing.md),

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
                        return null;
                      },
                    ),

                    SizedBox(height: AppSpacing.sm),

                    AppTextField(
                      controller: _passwordController,
                      label: 'Password',
                      obscureText: _obscurePassword,
                      textInputAction:
                          TextInputAction.done, //  done on keyboard
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

                    SizedBox(height: AppSpacing.md),

                    // ── Login Button ───────────────────────────────────
                    AppButton(
                      text: 'Sign In',
                      isLoading: _isLoading,
                      onPressed: _login,
                    ),

                    // SizedBox(height: AppSpacing.lg),
                    const Spacer(), 

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

                    SizedBox(height: AppSpacing.sm),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Social Buttons ────────────────────────────────────────────

  Widget _buildSocialButtons() {
    return Column(
      children: [
        // Google — full width on its own row
        SocialLoginButton(
          label: 'Continue with Google',
          iconAsset: 'assets/icons/google.svg',
          isLoading: _googleLoading,
          onTap: _anySocialLoading ? () {} : _googleSignIn,
        ),

        SizedBox(height: 12.h),

        // Apple — full width on its own row
        // only show on iOS
        // if (Platform.isIOS)
        SocialLoginButton(
          label: 'Continue with Apple',
          iconAsset: 'assets/icons/apple.svg',
          isLoading: _appleLoading,
          onTap: _anySocialLoading ? () {} : _appleSignIn,
        ),
      ],
    );
  }

  // ── Divider ───────────────────────────────────────────────────

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Text(
            'or sign in with account',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
