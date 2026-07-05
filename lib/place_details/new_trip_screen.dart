import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------
/// CENTRALIZED STRINGS (for future localization/multi-language support)
/// ---------------------------------------------------------------------
class NewTripStrings {
  static const String appBarTitle = 'New Trip';

  static const String bannerTitle = 'Your Trip';
  static String bannerSubtitle(int count) => '$count Places Selected';

  static const String totalCost = 'Total Cost';
  static const String estimatedDuration = 'Estimated Duration';
  static const String numberOfPlaces = 'Number of places';
  static const String durationValue = '1 Day';

  static const String generateTripPlan = 'Generate Trip Plan';

  static String placesCountLabel(int count) => '$count Places';
}

/// ---------------------------------------------------------------------
/// DATA MODEL
/// ---------------------------------------------------------------------
class TripPlaceModel {
  final String name;
  final String city;
  final int priceEgp;
  final String imageUrl;

  const TripPlaceModel({
    required this.name,
    required this.city,
    required this.priceEgp,
    required this.imageUrl,
  });
}

/// ---------------------------------------------------------------------
/// THEME CONSTANTS
/// ---------------------------------------------------------------------
class _AppColors {
  static const Color primaryBlue = Color(0xFF005BEA);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF8A8A8A);
  static const Color cardBorder = Color(0xFFEDEDED);
  static const Color deleteRed = Color(0xFFE53935);
  static const Color pageBackground = Color(0xFFF6F7F9);
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class NewTripScreen extends StatefulWidget {
  const NewTripScreen({super.key});

  @override
  State<NewTripScreen> createState() => _NewTripScreenState();
}

class _NewTripScreenState extends State<NewTripScreen> {
  final List<TripPlaceModel> _places = [
    const TripPlaceModel(
      name: 'Great pyramids of Giza',
      city: 'Giza',
      priceEgp: 240,
      imageUrl:
      'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?w=200&q=80',
    ),
    const TripPlaceModel(
      name: 'The Great Sphinx',
      city: 'Giza',
      priceEgp: 240,
      imageUrl:
      'https://images.unsplash.com/photo-1539768942893-daf53e448371?w=200&q=80',
    ),
    const TripPlaceModel(
      name: 'Egyptian Museum',
      city: 'Cairo',
      priceEgp: 210,
      imageUrl:
      'https://images.unsplash.com/photo-1608731267464-c0c889c2ff02?w=200&q=80',
    ),
    const TripPlaceModel(
      name: 'Cairo Citadel',
      city: 'Cairo',
      priceEgp: 180,
      imageUrl:
      'https://images.unsplash.com/photo-1572252009286-268acec5ca0a?w=200&q=80',
    ),
  ];

  int get _totalCost => _places.fold(0, (sum, place) => sum + place.priceEgp);

  void _removePlace(int index) {
    setState(() => _places.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AppColors.pageBackground,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBanner(),
                    const SizedBox(height: 18),
                    ...List.generate(
                      _places.length,
                          (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildPlaceCard(_places[index], index),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildSummarySection(),
                  ],
                ),
              ),
            ),
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // APP BAR
  // ---------------------------------------------------------------
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.06),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: _AppColors.textDark),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: const Text(
        NewTripStrings.appBarTitle,
        style: TextStyle(
          color: _AppColors.textDark,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // TOP BLUE BANNER
  // ---------------------------------------------------------------
  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(Icons.card_travel_rounded, color: Colors.white, size: 30),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                NewTripStrings.bannerTitle,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                NewTripStrings.bannerSubtitle(_places.length),
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // PLACE CARD
  // ---------------------------------------------------------------
  Widget _buildPlaceCard(TripPlaceModel place, int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              place.imageUrl,
              width: 58,
              height: 58,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 58,
                height: 58,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported_outlined, size: 18),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  place.city,
                  style: const TextStyle(fontSize: 12.5, color: _AppColors.textGrey),
                ),
                const SizedBox(height: 3),
                Text(
                  '${place.priceEgp} EGP',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.more_horiz,
                    color: _AppColors.textGrey, size: 20),
                onPressed: () => debugPrint('More options for ${place.name}'),
              ),
              const SizedBox(height: 10),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.delete_outline_rounded,
                    color: _AppColors.deleteRed, size: 20),
                onPressed: () => _removePlace(index),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // SUMMARY SECTION
  // ---------------------------------------------------------------
  Widget _buildSummarySection() {
    return Column(
      children: [
        _summaryRow(
          icon: Icons.attach_money_rounded,
          title: NewTripStrings.totalCost,
          value: '$_totalCost EGP',
        ),
        const SizedBox(height: 10),
        _summaryRow(
          icon: Icons.access_time_rounded,
          title: NewTripStrings.estimatedDuration,
          value: NewTripStrings.durationValue,
        ),
        const SizedBox(height: 10),
        _summaryRow(
          icon: Icons.location_on_outlined,
          title: NewTripStrings.numberOfPlaces,
          value: NewTripStrings.placesCountLabel(_places.length),
        ),
      ],
    );
  }

  Widget _summaryRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: _AppColors.textDark, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, color: _AppColors.textDark),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _AppColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // BOTTOM BUTTON
  // ---------------------------------------------------------------
  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 18),
      decoration: BoxDecoration(
        color: _AppColors.pageBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _AppColors.primaryBlue,
            shape: const StadiumBorder(),
            elevation: 0,
          ),
          onPressed: () {
            debugPrint(
              'Generate Trip Plan tapped -> ${_places.length} places, total $_totalCost EGP',
            );
          },
          child: const Text(
            NewTripStrings.generateTripPlan,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------
/// ENTRY POINT (for standalone preview / testing)
/// ---------------------------------------------------------------------
class NewTripApp extends StatelessWidget {
  const NewTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const NewTripScreen(),
    );
  }
}

void main() {
  runApp(const NewTripApp());
}