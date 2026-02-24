import 'package:doha_pride_customer/core/router/app_router.dart';
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_icon_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_button.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _usernameController    = TextEditingController();
  final _emailController       = TextEditingController();
  final _phoneController       = TextEditingController();
  final _passwordController    = TextEditingController();
  final _confirmPassController = TextEditingController();

    // Focus Nodes — so keyboard moves field to field smoothly
  final _usernameFocus    = FocusNode();
  final _emailFocus       = FocusNode();
  final _phoneFocus       = FocusNode();
  final _passwordFocus    = FocusNode();
  final _confirmPassFocus = FocusNode();

  bool _isLoading          = false;
  bool _obscurePassword    = true;
  bool _obscureConfirmPass = true;

  // ── Validators ───────────────────────────────────────────────────

  String? _validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }
    if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value.trim())) {
      return 'Username can only contain letters, numbers and underscores';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (value.trim().length < 8) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

    String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // ── Submit ───────────────────────────────────────────────────────

  Future<void> _register() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1)); // mock delay

    if (mounted) {
      setState(() => _isLoading = false);
      // context.go(AppRoutes.home); // uncomment when auth BLoC ready
    }
  }

    // ── Dispose ──────────────────────────────────────────────────────

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmPassFocus.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Iconsax.arrow_left,
              color: AppColors.textPrimary,
              size: AppIconSizes.md,
            ),
          ),
        ),
        body: SafeArea(child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding, vertical: AppSpacing.sm),
          child: Form(
            key: _formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               // ── Header ───────────────────────────────────────
                  Text(
                    'Create Account',
                    style: AppTextStyles.heading1,
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    'Fill in your details to get started',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),

                  SizedBox(height: AppSpacing.lg),

                  // ── Username ─────────────────────────────────────
                  // Text('Username', style: AppTextStyles.labelMedium),
                  SizedBox(height: AppSpacing.xs),
                  AppTextField(
                    controller: _usernameController,
                    label: 'Enter your username',
                    focusNode: _usernameFocus,
                    prefixIcon: Icon(
                      Iconsax.user,
                      size: AppIconSizes.sm,
                      color: AppColors.textSecondary,
                    ),
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.none,
                    inputFormatters: [
                      // no spaces allowed in username
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_emailFocus);
                    },
                    validator: _validateUsername,
                  ),

                      SizedBox(height: AppSpacing.md),

                  // ── Email ────────────────────────────────────────
                  // Text('Email Address', style: AppTextStyles.labelMedium),
                  SizedBox(height: AppSpacing.xs),
                  AppTextField(
                    controller: _emailController,
                    label: 'Enter your email',
                    focusNode: _emailFocus,
                    prefixIcon: Icon(
                      Iconsax.sms,
                      size: AppIconSizes.sm,
                      color: AppColors.textSecondary,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_phoneFocus);
                    },
                    validator: _validateEmail,
                  ),

                   SizedBox(height: AppSpacing.md),

                  // ── Phone ────────────────────────────────────────
                  // Text('Phone Number', style: AppTextStyles.labelMedium),
                  SizedBox(height: AppSpacing.xs),
                  _PhoneField(
                    controller: _phoneController,
                    focusNode: _phoneFocus,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocus);
                    },
                    validator: _validatePhone,
                  ),

                  SizedBox(height: AppSpacing.md),

               // ── Password ─────────────────────────────────────
                  // Text('Password', style: AppTextStyles.labelMedium),
                  SizedBox(height: AppSpacing.xs),
                  AppTextField(
                    controller: _passwordController,
                    label: 'Enter your password',
                    focusNode: _passwordFocus,
                    obscureText: _obscurePassword,
                    prefixIcon: Icon(
                      Iconsax.lock,
                      size:AppIconSizes.sm,
                      color: AppColors.textSecondary,
                    ),
                    suffixIcon: _PasswordToggle(
                      isObscure: _obscurePassword,
                      onTap: () => setState(
                        () => _obscurePassword = !_obscurePassword,
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_confirmPassFocus);
                    },
                    validator: _validatePassword,
                  ),

                  SizedBox(height: AppSpacing.xs),

                  // password strength hint
                  Text(
                    'Min 8 characters, one uppercase, one number',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),

                  SizedBox(height: AppSpacing.md),

                  // ── Confirm Password ──────────────────────────────
                  // Text('Confirm Password', style: AppTextStyles.labelMedium),
                  SizedBox(height: AppSpacing.xs),
                  AppTextField(
                    controller: _confirmPassController,
                    label: 'Re-enter your password',
                    focusNode: _confirmPassFocus,
                    obscureText: _obscureConfirmPass,
                    prefixIcon: Icon(
                      Iconsax.lock_1,
                      size: AppIconSizes.sm,
                      color: AppColors.textSecondary,
                    ),
                    suffixIcon: _PasswordToggle(
                      isObscure: _obscureConfirmPass,
                      onTap: () => setState(
                        () => _obscureConfirmPass = !_obscureConfirmPass,
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _register(),
                    validator: _validateConfirmPassword,
                  ),

                  SizedBox(height: AppSpacing.xl),

                  // ── Register Button ───────────────────────────────
                  AppButton(
                    text: 'Create Account',
                    isLoading: _isLoading,
                    onPressed: _register,
                  ),

                  SizedBox(height: AppSpacing.lg),

                  // ── Terms ─────────────────────────────────────────
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'By signing up, you agree to our ',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: AppSpacing.lg),

                  // ── Login Link ────────────────────────────────────
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go(AppRoutes.login),
                          child: Text(
                            'Sign In',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: AppSpacing.lg)


            ],
          ),),
        )),

      )
    );
  }
}


// ── Private Widgets ──────────────────────────────────────────────────────────
// kept private (underscore) because they're only used in this file

class _PasswordToggle extends StatelessWidget {
  final bool isObscure;
  final VoidCallback onTap;

  const _PasswordToggle({
    required this.isObscure,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        isObscure ? Iconsax.eye_slash : Iconsax.eye,
        size: AppIconSizes.sm,
        color: AppColors.textSecondary,
      ),
    );
  }
}

class _PhoneField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const _PhoneField({
    required this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
  });

  @override
  State<_PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<_PhoneField> {
  // default Qatar country code
  String _countryCode = '+974';

  final List<Map<String, String>> _countryCodes = [
    {'code': '+974', 'flag': '🇶🇦', 'name': 'Qatar'},
    {'code': '+971', 'flag': '🇦🇪', 'name': 'UAE'},
    {'code': '+966', 'flag': '🇸🇦', 'name': 'Saudi Arabia'},
    {'code': '+973', 'flag': '🇧🇭', 'name': 'Bahrain'},
    {'code': '+968', 'flag': '🇴🇲', 'name': 'Oman'},
    {'code': '+965', 'flag': '🇰🇼', 'name': 'Kuwait'},
    {'code': '+91',  'flag': '🇮🇳', 'name': 'India'},
    {'code': '+1',   'flag': '🇺🇸', 'name': 'USA'},
    {'code': '+44',  'flag': '🇬🇧', 'name': 'UK'},
    {'code': '+20',  'flag': '🇪🇬', 'name': 'Egypt'},
  ];

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: AppTextStyles.bodyMedium,
      decoration: InputDecoration(
        labelText: 'Enter phone number',
        labelStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        floatingLabelStyle: AppTextStyles.bodySmall.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
        // country code selector as prefix
        prefixIcon: GestureDetector(
          onTap: _showCountryPicker,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _countryCodes.firstWhere(
                    (c) => c['code'] == _countryCode,
                  )['flag']!,
                  style: TextStyle(fontSize: AppIconSizes.sm),
                ),
                SizedBox(width: AppSpacing.screenPaddingsm),
                Text(
                  _countryCode,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Iconsax.arrow_down_1,
                  size: AppIconSizes.xs,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.screenPaddingsm,
          vertical: AppSpacing.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        errorStyle: AppTextStyles.caption.copyWith(color: AppColors.error),
      ),
    );
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppSpacing.md),
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: AppSpacing.md),
            Text('Select Country Code', style: AppTextStyles.heading3),
            SizedBox(height: AppSpacing.sm),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _countryCodes.length,
              itemBuilder: (context, index) {
                final country = _countryCodes[index];
                final isSelected = country['code'] == _countryCode;
                return ListTile(
                  leading: Text(
                    country['flag']!,
                    style: TextStyle(fontSize: 24.sp),
                  ),
                  title: Text(
                    country['name']!,
                    style: AppTextStyles.bodyMedium,
                  ),
                  trailing: Text(
                    country['code']!,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w400,
                    ),
                  ),
                  selected: isSelected,
                  selectedTileColor: AppColors.primary.withValues(alpha: 0.05),
                  onTap: () {
                    setState(() => _countryCode = country['code']!);
                    Navigator.pop(context);
                  },
                );
              },
            ),
            SizedBox(height: AppSpacing.lg),
          ],
        );
      },
    );
  }
}