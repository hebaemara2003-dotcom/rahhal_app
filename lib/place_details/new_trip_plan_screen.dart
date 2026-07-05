import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------
/// CENTRALIZED STRINGS (for future localization/multi-language support)
/// ---------------------------------------------------------------------
class TripPlanStrings {
  static const String appBarTitle = 'New Trip';

  static const String totalCost = 'Total Cost';
  static const String estimatedDuration = 'Estimated Duration';
  static const String numberOfPlaces = 'Number of places';

  static const String startTrip = 'Start Trip';
}

/// ---------------------------------------------------------------------
/// DATA MODELS
/// ---------------------------------------------------------------------
class TripPlanStopModel {
  final String time;
  final String placeName;
  final String visitDuration;
  final String imageUrl;

  const TripPlanStopModel({
    required this.time,
    required this.placeName,
    required this.visitDuration,
    required this.imageUrl,
  });
}

class TripPlanModel {
  final String totalCost;
  final String estimatedDuration;
  final String placesCount;
  final List<TripPlanStopModel> stops;

  const TripPlanModel({
    required this.totalCost,
    required this.estimatedDuration,
    required this.placesCount,
    required this.stops,
  });
  factory TripPlanModel.fromJson(Map<String, dynamic> json) {
    return TripPlanModel(
      totalCost: json['totalCost'] != null ? json['totalCost'].toString() : '',
      estimatedDuration: json['estimatedDuration'] != null ? json['estimatedDuration'].toString() : '',
      placesCount: json['placesCount'] != null ? json['placesCount'].toString() : '',
      stops: (json['stops'] as List?)?.map((stop) => TripPlanStopModel(
        time: stop['time'] != null ? stop['time'].toString() : '',
        placeName: stop['placeName'] != null ? stop['placeName'].toString() : '',
        visitDuration: stop['visitDuration'] != null ? stop['visitDuration'].toString() : '',
        imageUrl: stop['imageUrl'] != null ? stop['imageUrl'].toString() : '',
      )).toList() ?? [],
    );
  }
}

/// ---------------------------------------------------------------------
/// MOCK DATA (simulating AI-generated output)
/// ---------------------------------------------------------------------
final TripPlanModel mockTripPlan = TripPlanModel(
  totalCost: '870 EGP',
  estimatedDuration: '1 Day',
  placesCount: '4 Places',
  stops: const [
    TripPlanStopModel(
      time: '09:00 AM',
      placeName: 'Great pyramids of Giza',
      visitDuration: '2.0 Hours',
      imageUrl:
      'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?w=200&q=80',
    ),
    TripPlanStopModel(
      time: '11:30 AM',
      placeName: 'The Great Sphinx',
      visitDuration: '1.5 Hours',
      imageUrl:
      'https://images.unsplash.com/photo-1539768942893-daf53e448371?w=200&q=80',
    ),
    TripPlanStopModel(
      time: '02:00 PM',
      placeName: 'Egyptian Museum',
      visitDuration: '2.0 Hours',
      imageUrl:
      'https://images.unsplash.com/photo-1608731267464-c0c889c2ff02?w=200&q=80',
    ),
    TripPlanStopModel(
      time: '04:30 PM',
      placeName: 'Cairo Citadel',
      visitDuration: '1.5 Hours',
      imageUrl:
      'https://images.unsplash.com/photo-1572252009286-268acec5ca0a?w=200&q=80',
    ),
  ],
);

/// ---------------------------------------------------------------------
/// THEME CONSTANTS
/// ---------------------------------------------------------------------
class _AppColors {
  static const Color primaryBlue = Color(0xFF005BEA);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF8A8A8A);
  static const Color cardBorder = Color(0xFFEDEDED);
  static const Color pageBackground = Color(0xFFF6F7F9);
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class NewTripPlanScreen extends StatelessWidget {
  final TripPlanModel tripPlan;

  const NewTripPlanScreen({super.key, required this.tripPlan});

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
                    _buildMapContainer(context),
                    const SizedBox(height: 18),
                    _buildSummarySection(),
                    const SizedBox(height: 18),
                    _buildTimelineCard(context),
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
        TripPlanStrings.appBarTitle,
        style: TextStyle(
          color: _AppColors.textDark,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // MAP CONTAINER (local asset)
  // ---------------------------------------------------------------
  Widget _buildMapContainer(BuildContext context) {
    final double mapHeight = MediaQuery.of(context).size.height * 0.19;

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        'assets/images/map_placeholder.png',
        width: double.infinity,
        height: mapHeight,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: double.infinity,
          height: mapHeight,
          color: Colors.grey.shade300,
          alignment: Alignment.center,
          child: const Icon(Icons.map_outlined, size: 32, color: Colors.grey),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // SUMMARY STATS
  // ---------------------------------------------------------------
  Widget _buildSummarySection() {
    return Column(
      children: [
        _summaryRow(
          icon: Icons.attach_money_rounded,
          title: TripPlanStrings.totalCost,
          value: tripPlan.totalCost,
        ),
        const SizedBox(height: 10),
        _summaryRow(
          icon: Icons.access_time_rounded,
          title: TripPlanStrings.estimatedDuration,
          value: tripPlan.estimatedDuration,
        ),
        const SizedBox(height: 10),
        _summaryRow(
          icon: Icons.location_on_outlined,
          title: TripPlanStrings.numberOfPlaces,
          value: tripPlan.placesCount,
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
  // TIMELINE CARD
  // ---------------------------------------------------------------
  Widget _buildTimelineCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: List.generate(tripPlan.stops.length, (index) {
          final stop = tripPlan.stops[index];
          final bool isLast = index == tripPlan.stops.length - 1;
          return _buildTimelineRow(stop, isLast);
        }),
      ),
    );
  }

  Widget _buildTimelineRow(TripPlanStopModel stop, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 52,
            child: Text(
              stop.time,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: _AppColors.primaryBlue,
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(
                  color: _AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: _AppColors.primaryBlue.withOpacity(0.25),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _buildStopCard(stop),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStopCard(TripPlanStopModel stop) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _AppColors.cardBorder),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              stop.imageUrl,
              width: 54,
              height: 54,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 54,
                height: 54,
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
                  stop.placeName,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: _AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded,
                        size: 13, color: _AppColors.textGrey),
                    const SizedBox(width: 4),
                    Text(
                      stop.visitDuration,
                      style: const TextStyle(
                        fontSize: 12,
                        color: _AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ],
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
            debugPrint('Start Trip tapped');
          },
          child: const Text(
            TripPlanStrings.startTrip,
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
class NewTripPlanApp extends StatelessWidget {
  const NewTripPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: NewTripPlanScreen(tripPlan: mockTripPlan),
    );
  }
}

void main() {
  runApp(const NewTripPlanApp());
}