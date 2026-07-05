import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------
/// CENTRALIZED STRINGS (for future localization/multi-language support)
/// ---------------------------------------------------------------------
class AdminDashboardStrings {
  static const String appBarTitle = 'Admin Dashboard';

  static const String adminName = 'Admin John Cena';
  static const String adminEmail = 'johncena@gmail.com';

  static const String overview = 'Overview';

  static const String usersLabel = 'Users';
  static const String usersCount = '1,248';
  static const String usersTrend = '+32 this week';

  static const String placesLabel = 'Places';
  static const String placesCount = '156';
  static const String placesTrend = '+5 this week';

  static const String tripPlansLabel = 'Trip Plans';
  static const String tripPlansCount = '24';
  static const String tripPlansTrend = '+3 this week';

  static const String scansLabel = 'Scans';
  static const String scansCount = '3,456';
  static const String scansTrend = '+120 this week';

  static const String quickAction = 'Quick Action';
  static const String editPlaces = 'Edit Places';
  static const String editPlacesSubtitle = 'Edit existing Places';
}

/// ---------------------------------------------------------------------
/// DATA MODEL
/// ---------------------------------------------------------------------
class OverviewStatModel {
  final IconData icon;
  final Color iconBgColor;
  final String count;
  final String label;
  final String trend;

  const OverviewStatModel({
    required this.icon,
    required this.iconBgColor,
    required this.count,
    required this.label,
    required this.trend,
  });
}

/// ---------------------------------------------------------------------
/// PRIVATE THEME COLORS
/// ---------------------------------------------------------------------
class _AdminColors {
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF8A8A8A);
  static const Color trendGreen = Color(0xFF2E9E5B);
  static const Color cardBorder = Color(0xFFEDEDED);
  static const Color pageBackground = Colors.white;

  static const Color bannerBg = Color(0xFFDCEBFA);
  static const Color bannerBgLight = Color(0xFFEFF6FD);

  static const Color usersIconBg = Color(0xFF3B82F6);
  static const Color placesIconBg = Color(0xFF22A06B);
  static const Color tripPlansIconBg = Color(0xFFF39C24);
  static const Color scansIconBg = Color(0xFF8B5CF6);

  static const Color quickActionBg = Color(0xFFEFFBF3);
  static const Color quickActionBorder = Color(0xFFD9F0E0);
  static const Color quickActionIconBg = Color(0xFF34C471);
  static const Color quickActionTitle = Color(0xFF0F5132);
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  List<OverviewStatModel> get _stats => const [
    OverviewStatModel(
      icon: Icons.people_alt_rounded,
      iconBgColor: _AdminColors.usersIconBg,
      count: AdminDashboardStrings.usersCount,
      label: AdminDashboardStrings.usersLabel,
      trend: AdminDashboardStrings.usersTrend,
    ),
    OverviewStatModel(
      icon: Icons.account_balance_rounded,
      iconBgColor: _AdminColors.placesIconBg,
      count: AdminDashboardStrings.placesCount,
      label: AdminDashboardStrings.placesLabel,
      trend: AdminDashboardStrings.placesTrend,
    ),
    OverviewStatModel(
      icon: Icons.card_travel_rounded,
      iconBgColor: _AdminColors.tripPlansIconBg,
      count: AdminDashboardStrings.tripPlansCount,
      label: AdminDashboardStrings.tripPlansLabel,
      trend: AdminDashboardStrings.tripPlansTrend,
    ),
    OverviewStatModel(
      icon: Icons.qr_code_scanner_rounded,
      iconBgColor: _AdminColors.scansIconBg,
      count: AdminDashboardStrings.scansCount,
      label: AdminDashboardStrings.scansLabel,
      trend: AdminDashboardStrings.scansTrend,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AdminColors.pageBackground,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AdminDashboardStrings.overview,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: _AdminColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _buildOverviewGrid(),
                    const SizedBox(height: 24),
                    const Text(
                      AdminDashboardStrings.quickAction,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: _AdminColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _buildQuickActionCard(),
                  ],
                ),
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
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.06),
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        AdminDashboardStrings.appBarTitle,
        style: TextStyle(
          color: _AdminColors.textDark,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // PROFILE HEADER + BANNER
  // ---------------------------------------------------------------
  Widget _buildProfileHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Stylized banner background
        Container(
          width: double.infinity,
          height: 130,
          margin: const EdgeInsets.only(top: 74),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                _AdminColors.bannerBgLight,
                _AdminColors.bannerBg,
              ],
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          child: CustomPaint(
            painter: _DesertSkylinePainter(),
            child: const SizedBox.expand(),
          ),
        ),
        // Profile row
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.account_circle_rounded,
                  size: 56,
                  color: Color(0xFF3B4B66),
                ),
              ),
              const SizedBox(width: 14),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AdminDashboardStrings.adminName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _AdminColors.textDark,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    AdminDashboardStrings.adminEmail,
                    style: TextStyle(
                      fontSize: 12.5,
                      color: _AdminColors.textGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------
  // OVERVIEW GRID (2x2)
  // ---------------------------------------------------------------
  Widget _buildOverviewGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 0.90,
      children: _stats.map(_buildStatCard).toList(),
    );
  }

  Widget _buildStatCard(OverviewStatModel stat) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _AdminColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: stat.iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(stat.icon, color: Colors.white, size: 20),
          ),
          const SizedBox (height: 6),
          Text(
            stat.count,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _AdminColors.textDark,
            ),
          ),
          Text(
            stat.label,
            style: const TextStyle(fontSize: 12.5, color: _AdminColors.textGrey),
          ),
          Row(
            children: [
              Text(
                stat.trend,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: _AdminColors.trendGreen,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.arrow_upward_rounded,
                size: 12,
                color: _AdminColors.trendGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // QUICK ACTION CARD
  // ---------------------------------------------------------------
  Widget _buildQuickActionCard() {
    return InkWell(
      onTap: () => debugPrint('Edit Places tapped'),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _AdminColors.quickActionBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _AdminColors.quickActionBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: _AdminColors.quickActionIconBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit_rounded, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 14),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AdminDashboardStrings.editPlaces,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: _AdminColors.quickActionTitle,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  AdminDashboardStrings.editPlacesSubtitle,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: _AdminColors.textGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------
/// SIMPLE DECORATIVE SKYLINE PAINTER (stand-in for the desert/pyramids art)
/// ---------------------------------------------------------------------
class _DesertSkylinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint farPaint = Paint()..color = Colors.white.withOpacity(0.35);
    final Paint nearPaint = Paint()..color = Colors.white.withOpacity(0.55);

    final Path farPath = Path()
      ..moveTo(0, size.height * 0.6)
      ..lineTo(size.width * 0.2, size.height * 0.25)
      ..lineTo(size.width * 0.38, size.height * 0.6)
      ..lineTo(size.width * 0.55, size.height * 0.2)
      ..lineTo(size.width * 0.75, size.height * 0.6)
      ..lineTo(size.width, size.height * 0.35)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(farPath, farPaint);

    final Path nearPath = Path()
      ..moveTo(0, size.height * 0.85)
      ..lineTo(size.width * 0.15, size.height * 0.55)
      ..lineTo(size.width * 0.3, size.height * 0.85)
      ..lineTo(size.width * 0.5, size.height * 0.5)
      ..lineTo(size.width * 0.7, size.height * 0.85)
      ..lineTo(size.width * 0.85, size.height * 0.6)
      ..lineTo(size.width, size.height * 0.85)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(nearPath, nearPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// ---------------------------------------------------------------------
/// ENTRY POINT (for standalone preview / testing)
/// ---------------------------------------------------------------------
class AdminDashboardApp extends StatelessWidget {
  const AdminDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const AdminDashboardScreen(),
    );
  }
}


void main() {
  runApp(const AdminDashboardApp());
}