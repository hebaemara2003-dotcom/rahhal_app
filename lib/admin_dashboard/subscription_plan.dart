import 'package:flutter/material.dart';

// ============================================================
// STRINGS
// ============================================================
class SubscriptionStrings {
  static const String appBarTitle = 'Subscription plan';
  static const String getPremium = 'Get Premium';
  static const String allBasicFeatures = 'All basic features';
  static const String perMonth = 'per month';
  static const String orderNow = 'Order now';

  static const String simplePlan = 'Simple plan';
  static const String basicPlan = 'Basic plan';
  static const String standardPlan = 'Standard plan';

  static const String simplePlanPrice = '200 EGP';
  static const String basicPlanPrice = '400 EGP';
  static const String standardPlanPrice = '5000 EGP';
}

// ============================================================
// COLORS & STYLES
// ============================================================
class SubscriptionColors {
  static const Color scaffoldBackground = Color(0xFFF3F4F6);
  static const Color appBarBackground = Colors.white;
  static const Color appBarDivider = Color(0xFFE5E7EB);
  static const Color appBarTitleColor = Color(0xFF111827);

  static const Color bannerGradientStart = Color(0xFF9B8CF0);
  static const Color bannerGradientEnd = Color(0xFFC7BDF7);
  static const Color bannerVectorTint = Color(0x33FFFFFF);
  static const Color shieldBackground = Colors.white;
  static const Color starColor = Color(0xFF6C5CE7);
  static const Color getPremiumTextColor = Color(0xFF4B3FA0);

  static const Color cardBackgroundDefault = Color(0xFFF8F8FA);
  static const Color cardBackgroundSelected = Color(0xFFF3F1FD);
  static const Color cardBorderDefault = Color(0xFFE5E7EB);
  static const Color cardBorderSelected = Color(0xFF6C5CE7);

  static const Color radioSelectedColor = Color(0xFF6C5CE7);
  static const Color radioUnselectedColor = Color(0xFFC4C4C4);

  static const Color planTitleColor = Color(0xFF1F2937);
  static const Color featureCheckColor = Color(0xFF22C55E);
  static const Color featureTextColor = Color(0xFF6B7280);

  static const Color priceTextColor = Color(0xFF1F2937);
  static const Color priceSubTextColor = Color(0xFF9CA3AF);

  static const Color orderButtonColor = Color(0xFF6C4CE0);
  static const Color orderButtonTextColor = Colors.white;

  static const TextStyle appBarTitleStyle = TextStyle(
    color: appBarTitleColor,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle getPremiumStyle = TextStyle(
    color: getPremiumTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle planTitleStyle = TextStyle(
    color: planTitleColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle featureTextStyle = TextStyle(
    color: featureTextColor,
    fontSize: 12.5,
  );

  static const TextStyle priceTextStyle = TextStyle(
    color: priceTextColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle priceSubTextStyle = TextStyle(
    color: priceSubTextColor,
    fontSize: 11.5,
  );

  static const TextStyle orderButtonTextStyle = TextStyle(
    color: orderButtonTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

// ============================================================
// DATA MODEL
// ============================================================
class SubscriptionPlan {
  final String title;
  final String price;
  final String period;

  const SubscriptionPlan({
    required this.title,
    required this.price,
    required this.period,
  });
}

// ============================================================
// SCREEN
// ============================================================
class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final List<SubscriptionPlan> _plans = const [
    SubscriptionPlan(
      title: SubscriptionStrings.simplePlan,
      price: SubscriptionStrings.simplePlanPrice,
      period: SubscriptionStrings.perMonth,
    ),
    SubscriptionPlan(
      title: SubscriptionStrings.basicPlan,
      price: SubscriptionStrings.basicPlanPrice,
      period: SubscriptionStrings.perMonth,
    ),
    SubscriptionPlan(
      title: SubscriptionStrings.standardPlan,
      price: SubscriptionStrings.standardPlanPrice,
      period: SubscriptionStrings.perMonth,
    ),
  ];

  int _selectedIndex = 0;

  void _onPlanSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onOrderNowPressed() {
    // TODO: Hook up checkout / order flow for _plans[_selectedIndex].
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SubscriptionColors.scaffoldBackground,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildPremiumBanner(),
                    const SizedBox(height: 20),
                    _buildPlanList(),
                  ],
                ),
              ),
            ),
            _buildOrderNowBar(),
          ],
        ),
      ),
    );
  }

  // ---------------- AppBar ----------------
  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Container(
        decoration: const BoxDecoration(
          color: SubscriptionColors.appBarBackground,
          border: Border(
            bottom: BorderSide(
              color: SubscriptionColors.appBarDivider,
              width: 1,
            ),
          ),
        ),
        child: AppBar(
          backgroundColor: SubscriptionColors.appBarBackground,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            SubscriptionStrings.appBarTitle,
            style: SubscriptionColors.appBarTitleStyle,
          ),
        ),
      ),
    );
  }

  // ---------------- Premium Banner ----------------
  Widget _buildPremiumBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 190,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              SubscriptionColors.bannerGradientStart,
              SubscriptionColors.bannerGradientEnd,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _MonumentSilhouettePainter(),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildShieldWithStar(),
                const SizedBox(height: 10),
                const Text(
                  SubscriptionStrings.getPremium,
                  style: SubscriptionColors.getPremiumStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShieldWithStar() {
    return SizedBox(
      width: 68,
      height: 74,
      child: CustomPaint(
        painter: _ShieldPainter(),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Icon(
              Icons.star_rounded,
              color: SubscriptionColors.starColor,
              size: 34,
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- Plan List ----------------
  Widget _buildPlanList() {
    return Column(
      children: List.generate(_plans.length, (index) {
        final bool isSelected = index == _selectedIndex;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _PlanOptionCard(
            plan: _plans[index],
            isSelected: isSelected,
            onTap: () => _onPlanSelected(index),
          ),
        );
      }),
    );
  }

  // ---------------- Order Now Bar ----------------
  Widget _buildOrderNowBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
      decoration: const BoxDecoration(
        color: SubscriptionColors.scaffoldBackground,
      ),
      child: SizedBox(
        height: 52,
        child: ElevatedButton(
          onPressed: _onOrderNowPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: SubscriptionColors.orderButtonColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            SubscriptionStrings.orderNow,
            style: SubscriptionColors.orderButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PRIVATE PLAN OPTION CARD
// ============================================================
class _PlanOptionCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isSelected;
  final VoidCallback onTap;

  const _PlanOptionCard({
    required this.plan,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? SubscriptionColors.cardBackgroundSelected
              : SubscriptionColors.cardBackgroundDefault,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? SubscriptionColors.cardBorderSelected
                : SubscriptionColors.cardBorderDefault,
            width: isSelected ? 1.6 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildRadioIndicator(),
            const SizedBox(width: 12),
            Expanded(child: _buildPlanDetails()),
            const SizedBox(width: 8),
            _buildPriceColumn(),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioIndicator() {
    return SizedBox(
      width: 22,
      height: 22,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? SubscriptionColors.radioSelectedColor
                : SubscriptionColors.radioUnselectedColor,
            width: 2,
          ),
        ),
        child: isSelected
            ? Center(
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: SubscriptionColors.radioSelectedColor,
            ),
          ),
        )
            : null,
      ),
    );
  }

  Widget _buildPlanDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          plan.title,
          style: SubscriptionColors.planTitleStyle,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              size: 14,
              color: SubscriptionColors.featureCheckColor,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                SubscriptionStrings.allBasicFeatures,
                style: SubscriptionColors.featureTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          plan.price,
          style: SubscriptionColors.priceTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          plan.period,
          style: SubscriptionColors.priceSubTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

// ============================================================
// DECORATIVE PAINTERS
// ============================================================

/// Draws a soft white shield silhouette behind the star icon.
class _ShieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = SubscriptionColors.shieldBackground
      ..style = PaintingStyle.fill;

    final double w = size.width;
    final double h = size.height;

    final Path path = Path()
      ..moveTo(w * 0.5, 0)
      ..lineTo(w * 0.92, h * 0.16)
      ..lineTo(w * 0.92, h * 0.5)
      ..cubicTo(w * 0.92, h * 0.8, w * 0.72, h * 0.95, w * 0.5, h)
      ..cubicTo(w * 0.28, h * 0.95, w * 0.08, h * 0.8, w * 0.08, h * 0.5)
      ..lineTo(w * 0.08, h * 0.16)
      ..close();

    canvas.drawShadow(path, Colors.black26, 4, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Draws faint monument silhouettes (pyramids + minaret-like tower)
/// in the banner background to echo the historical theme.
class _MonumentSilhouettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = SubscriptionColors.bannerVectorTint
      ..style = PaintingStyle.fill;

    final double w = size.width;
    final double h = size.height;

    // Left pyramid cluster.
    final Path pyramids = Path()
      ..moveTo(w * 0.02, h)
      ..lineTo(w * 0.14, h * 0.55)
      ..lineTo(w * 0.26, h)
      ..close()
      ..moveTo(w * 0.16, h)
      ..lineTo(w * 0.28, h * 0.68)
      ..lineTo(w * 0.40, h)
      ..close();
    canvas.drawPath(pyramids, paint);

    // Right tower silhouette.
    final Paint towerPaint = Paint()
      ..color = SubscriptionColors.bannerVectorTint
      ..style = PaintingStyle.fill;

    final Path tower = Path()
      ..moveTo(w * 0.86, h)
      ..lineTo(w * 0.86, h * 0.45)
      ..lineTo(w * 0.83, h * 0.38)
      ..lineTo(w * 0.86, h * 0.30)
      ..lineTo(w * 0.89, h * 0.38)
      ..lineTo(w * 0.86, h * 0.45)
      ..lineTo(w * 0.90, h * 0.55)
      ..lineTo(w * 0.90, h)
      ..close();
    canvas.drawPath(tower, towerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================
// STANDALONE PREVIEW APP
// ============================================================
class SubscriptionApp extends StatelessWidget {
  const SubscriptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Subscription Plan',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const SubscriptionScreen(),
    );
  }
}
void main() {
  runApp(const SubscriptionApp());
}