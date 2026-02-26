// features/profile/presentation/pages/profile_tab.dart
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_secondary_appbar.dart';
import 'package:doha_pride_customer/features/profile/presentation/widgets/profile_menu_widget.dart';
import 'package:doha_pride_customer/features/profile/presentation/widgets/profile_card.dart';
import 'package:doha_pride_customer/features/profile/presentation/widgets/profile_stats_row.dart';
import 'package:doha_pride_customer/features/profile/presentation/widgets/profile_toggle_chip.dart';
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
                    const SectionAppBar(
                      title: 'Profile',
                      subtitle: 'Manage your account',
                    ),

                    // ── Profile Card ────────────────────────────
                    ProfileCard(
                      name: _user['name'] as String,
                      email: _user['email'] as String,
                      phone: _user['phone'] as String,
                      onEditTap: () {
                        // TODO: navigate to edit profile
                      },
                    ),

                    SizedBox(height: AppSpacing.lg),

                    // ── Stats Row ───────────────────────────────
                    ProfileStatsRow(
                      totalBookings: _user['totalBookings'] as int,
                      completedTrips: _user['completedTrips'] as int,
                      loyaltyPoints: 840,
                    ),

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

  // ── Section Label ─────────────────────────────────────────────

  Widget _buildSectionLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(label, style: AppTextStyles.heading3),
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
          trailing: ProfileToggleChip(value: true, onChanged: (_) {}),
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
          trailing: ProfileToggleChip(value: false, onChanged: (_) {}),
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
          color: AppColors.error.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.logout, size: 20.sp, color: AppColors.error),
            SizedBox(width: 8.w),
            Text(
              'Logout',
              style: AppTextStyles.labelLarge.copyWith(color: AppColors.error),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: items),
    );
  }
}

// ── Toggle chip moved to its own reusable widget in widgets/profile_toggle_chip.dart ──
