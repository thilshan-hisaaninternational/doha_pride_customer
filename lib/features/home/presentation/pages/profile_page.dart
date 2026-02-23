// features/profile/presentation/pages/profile_tab.dart
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/profile_avatar.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/profile_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  // mock user data — replace with UserEntity from BLoC later
  static const _user = {
    'name': 'Thilshan Mohamed',
    'email': 'thilshan@gmail.com',
    'phone': '+974 5512 3456',
    'memberSince': 'Member since Jan 2025',
    'totalBookings': 12,
    'completedTrips': 9,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [

            // ── AppBar ──────────────────────────────────────────
            // AppPageAppBar(
            //   title: 'My Profile',
            //   subtitle: _user['memberSince'] as String,
            //   onNotificationTap: () {},
            // ),

            // ── Scrollable Body ─────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.screenPadding,
                  0,
                  AppSpacing.screenPadding,
                  120.h,
                ),
                child: Column(
                  children: [

                    // ── Profile Card ────────────────────────────
                    _buildProfileCard(),

                    SizedBox(height: AppSpacing.lg),

                    // ── Stats Row ───────────────────────────────
                    _buildStatsRow(),

                    SizedBox(height: AppSpacing.lg),

                    // ── Account Section ─────────────────────────
                    _buildSectionLabel('Account'),
                    SizedBox(height: AppSpacing.sm),
                    _buildAccountSection(context),

                    SizedBox(height: AppSpacing.lg),

                    // ── Preferences Section ─────────────────────
                    _buildSectionLabel('Preferences'),
                    SizedBox(height: AppSpacing.sm),
                    _buildPreferencesSection(),

                    SizedBox(height: AppSpacing.lg),

                    // ── Support Section ──────────────────────────
                    _buildSectionLabel('Support'),
                    SizedBox(height: AppSpacing.sm),
                    _buildSupportSection(),

                    SizedBox(height: AppSpacing.lg),

                    // ── Logout ───────────────────────────────────
                    _buildLogoutButton(context),

                    SizedBox(height: AppSpacing.lg),

                    // ── App Version ──────────────────────────────
                    Text(
                      'Doha Pride v1.0.0',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Profile Card ──────────────────────────────────────────────

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // avatar
          ProfileAvatar(
            name: _user['name'] as String,
            size: 64,
          ),

          SizedBox(width: 16.w),

          // user info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _user['name'] as String,
                  style: AppTextStyles.heading3.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  _user['email'] as String,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  _user['phone'] as String,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),

          // edit button
          GestureDetector(
            onTap: () {
              // context.push(AppRoutes.editProfile)
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Iconsax.edit,
                size: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Stats Row ─────────────────────────────────────────────────

  Widget _buildStatsRow() {
    return Row(
      children: [
        _StatBox(
          label: 'Total\nBookings',
          value: '${_user['totalBookings']}',
          icon: Iconsax.ticket_2,
          color: AppColors.primary,
        ),
        SizedBox(width: 12.w),
        _StatBox(
          label: 'Completed\nTrips',
          value: '${_user['completedTrips']}',
          icon: Iconsax.tick_circle,
          color: AppColors.success,
        ),
        SizedBox(width: 12.w),
        _StatBox(
          label: 'Loyalty\nPoints',
          value: '840',
          icon: Iconsax.star,
          color: AppColors.accent,
        ),
      ],
    );
  }

  // ── Section Label ─────────────────────────────────────────────

  Widget _buildSectionLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: AppTextStyles.heading3,
      ),
    );
  }

  // ── Account Section ───────────────────────────────────────────

  Widget _buildAccountSection(BuildContext context) {
    return _MenuGroup(
      items: [
        ProfileMenuItem(
          icon: Iconsax.user_edit,
          label: 'Edit Profile',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Iconsax.lock,
          label: 'Change Password',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Iconsax.card,
          label: 'Payment Methods',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Iconsax.location,
          label: 'Saved Addresses',
          onTap: () {},
          showDivider: false,
        ),
      ],
    );
  }

  // ── Preferences Section ───────────────────────────────────────

  Widget _buildPreferencesSection() {
    return _MenuGroup(
      items: [
        ProfileMenuItem(
          icon: Iconsax.notification,
          label: 'Notifications',
          onTap: () {},
          trailing: _ToggleChip(value: true, onChanged: (_) {}),
        ),
        ProfileMenuItem(
          icon: Iconsax.global,
          label: 'Language',
          onTap: () {},
          trailingText: 'English',
        ),
        ProfileMenuItem(
          icon: Iconsax.moon,
          label: 'Dark Mode',
          onTap: () {},
          trailing: _ToggleChip(value: false, onChanged: (_) {}),
          showDivider: false,
        ),
      ],
    );
  }

  // ── Support Section ───────────────────────────────────────────

  Widget _buildSupportSection() {
    return _MenuGroup(
      items: [
        ProfileMenuItem(
          icon: Iconsax.message_question,
          label: 'Help & Support',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Iconsax.info_circle,
          label: 'About Us',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Iconsax.shield_tick,
          label: 'Privacy Policy',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Iconsax.document_text,
          label: 'Terms of Service',
          onTap: () {},
          showDivider: false,
        ),
      ],
    );
  }

  // ── Logout Button ─────────────────────────────────────────────

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showLogoutDialog(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.error.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: AppColors.error.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.logout, size: 20.sp, color: AppColors.error),
            SizedBox(width: 8.w),
            Text(
              'Logout',
              style: AppTextStyles.labelLarge.copyWith(
                color: AppColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Logout Dialog ─────────────────────────────────────────────

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text('Logout', style: AppTextStyles.heading3),
        content: Text(
          'Are you sure you want to logout from Doha Pride?',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              // context.go(AppRoutes.login) after clearing auth
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                'Logout',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Stat Box ──────────────────────────────────────────────────────────────────

class _StatBox extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatBox({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 22.sp, color: color),
            SizedBox(height: 6.h),
            Text(
              value,
              style: AppTextStyles.heading2.copyWith(color: color),
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Menu Group (card wrapper) ─────────────────────────────────────────────────

class _MenuGroup extends StatelessWidget {
  final List<ProfileMenuItem> items;

  const _MenuGroup({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: items),
    );
  }
}

// ── Toggle Chip ───────────────────────────────────────────────────────────────

class _ToggleChip extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleChip({required this.value, required this.onChanged});

  @override
  State<_ToggleChip> createState() => _ToggleChipState();
}

class _ToggleChipState extends State<_ToggleChip> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _value = !_value);
        widget.onChanged(_value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 44.w,
        height: 24.h,
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: _value ? AppColors.primary : AppColors.divider,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 18.w,
            height: 18.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}