import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------
/// CENTRALIZED STRINGS (for future localization/multi-language support)
/// ---------------------------------------------------------------------
class SettingsStrings {
  static const String appBarTitle = 'Settings';

  static const String userName = 'Ahmed Mohammed';
  static const String userEmail = 'ahmed.mohammed@gmail.com';
  static const String avatarLetter = 'A';

  static const String sectionAccountSettings = 'Account Settings';
  static const String editProfile = 'Edit Profile';
  static const String language = 'Language';
  static const String languageValue = 'English';
  static const String changePassword = 'Change Password';

  static const String sectionNotifications = 'Notifications';
  static const String tripReminders = 'Trip Reminders';
  static const String liveArrivalAlerts = 'Live Arrival Alerts';
  static const String serviceDisruptions = 'Service Disruptions or Delays';

  static const String sectionPrivacyLocation = 'Privacy & Location';
  static const String liveLocationSharing = 'Live Location Sharing';
  static const String privacyPolicy = 'Privacy Policy';

  static const String sectionSubscriptionPlan = 'Subscription plan';
  static const String getPremium = 'Get Premium';

  static const String sectionAccountActions = 'Account Actions';
  static const String logout = 'Logout';
  static const String deleteAccount = 'Delete Account';
}

/// ---------------------------------------------------------------------
/// THEME CONSTANTS
/// ---------------------------------------------------------------------
class _AppColors {
  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF8A8A8A);
  static const Color profileCardBg = Color(0xFFF6F7F9);
  static const Color divider = Color(0xFFEFEFEF);
  static const Color pageBackground = Colors.white;
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _tripReminders = false;
  bool _liveArrivalAlerts = false;
  bool _serviceDisruptions = false;
  bool _liveLocationSharing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AppColors.pageBackground,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(),
              const SizedBox(height: 20),
              _buildSectionTitle(SettingsStrings.sectionAccountSettings),
              _buildSettingsRow(
                icon: Icons.person_outline,
                title: SettingsStrings.editProfile,
                trailing: _chevron(),
                onTap: () => debugPrint('Edit Profile tapped'),
              ),
              _divider(),
              _buildSettingsRow(
                icon: Icons.language_rounded,
                title: SettingsStrings.language,
                trailing: _languageTrailing(),
                onTap: () => debugPrint('Language tapped'),
              ),
              _divider(),
              _buildSettingsRow(
                icon: Icons.lock_outline_rounded,
                title: SettingsStrings.changePassword,
                trailing: _chevron(),
                onTap: () => debugPrint('Change Password tapped'),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle(SettingsStrings.sectionNotifications),
              _buildSettingsRow(
                icon: Icons.notifications_none_rounded,
                title: SettingsStrings.tripReminders,
                trailing: Switch(
                  value: _tripReminders,
                  activeColor: _AppColors.primaryBlue,
                  onChanged: (value) => setState(() => _tripReminders = value),
                ),
              ),
              _divider(),
              _buildSettingsRow(
                icon: Icons.notifications_active_outlined,
                title: SettingsStrings.liveArrivalAlerts,
                trailing: Switch(
                  value: _liveArrivalAlerts,
                  activeColor: _AppColors.primaryBlue,
                  onChanged: (value) =>
                      setState(() => _liveArrivalAlerts = value),
                ),
              ),
              _divider(),
              _buildSettingsRow(
                icon: Icons.error_outline_rounded,
                title: SettingsStrings.serviceDisruptions,
                trailing: Switch(
                  value: _serviceDisruptions,
                  activeColor: _AppColors.primaryBlue,
                  onChanged: (value) =>
                      setState(() => _serviceDisruptions = value),
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle(SettingsStrings.sectionPrivacyLocation),
              _buildSettingsRow(
                icon: Icons.location_on_outlined,
                title: SettingsStrings.liveLocationSharing,
                trailing: Switch(
                  value: _liveLocationSharing,
                  activeColor: _AppColors.primaryBlue,
                  onChanged: (value) =>
                      setState(() => _liveLocationSharing = value),
                ),
              ),
              _divider(),
              _buildSettingsRow(
                icon: Icons.shield_outlined,
                title: SettingsStrings.privacyPolicy,
                trailing: _chevron(),
                onTap: () => debugPrint('Privacy Policy tapped'),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle(SettingsStrings.sectionSubscriptionPlan),
              _buildSettingsRow(
                icon: Icons.star_rounded,
                title: SettingsStrings.getPremium,
                iconColor: _AppColors.primaryBlue,
                trailing: _chevron(),
                onTap: () => debugPrint('Get Premium tapped'),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle(SettingsStrings.sectionAccountActions),
              _buildSettingsRow(
                icon: Icons.logout_rounded,
                title: SettingsStrings.logout,
                trailing: _chevron(),
                onTap: () => debugPrint('Logout tapped'),
              ),
              _divider(),
              _buildSettingsRow(
                icon: Icons.person_remove_alt_1_outlined,
                title: SettingsStrings.deleteAccount,
                trailing: _chevron(),
                onTap: () => debugPrint('Delete Account tapped'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // APP BAR
  // ---------------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 20,
      title: Row(
        children: const [
          Icon(Icons.settings, color: _AppColors.textDark, size: 22),
          SizedBox(width: 8),
          Text(
            SettingsStrings.appBarTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _AppColors.textDark,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: _AppColors.primaryBlue),
          onPressed: () => debugPrint('Search tapped'),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------
  // PROFILE CARD
  // ---------------------------------------------------------------
  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _AppColors.profileCardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _AppColors.primaryBlue, width: 1.4),
            ),
            alignment: Alignment.center,
            child: const Text(
              SettingsStrings.avatarLetter,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _AppColors.primaryBlue,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                SettingsStrings.userName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: _AppColors.textDark,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                SettingsStrings.userEmail,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: _AppColors.textGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // SECTION TITLE
  // ---------------------------------------------------------------
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: _AppColors.textDark,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // GENERIC SETTINGS ROW
  // ---------------------------------------------------------------
  Widget _buildSettingsRow({
    required IconData icon,
    required String title,
    required Widget trailing,
    Color iconColor = _AppColors.primaryBlue,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 21, color: iconColor),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: _AppColors.textDark,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _chevron() {
    return const Icon(
      Icons.chevron_right_rounded,
      color: _AppColors.textGrey,
      size: 22,
    );
  }

  Widget _languageTrailing() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          SettingsStrings.languageValue,
          style: TextStyle(
            fontSize: 13.5,
            color: _AppColors.primaryBlue,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 4),
        Icon(
          Icons.arrow_drop_down_rounded,
          color: _AppColors.primaryBlue,
          size: 18,
        ),
      ],
    );
  }

  Widget _divider() {
    return const Divider(color: _AppColors.divider, height: 1);
  }
}

/// ---------------------------------------------------------------------
/// ENTRY POINT (for standalone preview / testing)
/// ---------------------------------------------------------------------
class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const SettingsScreen(),
    );
  }
}

void main() {
  runApp(const SettingsApp());
}