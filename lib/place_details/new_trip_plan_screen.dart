import 'package:flutter/material.dart';

import '../model_api/generate_itinerary/generate_itinerary_response.dart';

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
class NewTripPlanScreen extends StatefulWidget {

final Data trip;

const NewTripPlanScreen({
super.key,
required this.trip,
});

  @override
  State<NewTripPlanScreen> createState() => _NewTripPlanScreenState();
}

class _NewTripPlanScreenState extends State<NewTripPlanScreen> {
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
  Widget _buildSummarySection() {
    return Column(
      children: [
        _summaryRow(
          icon: Icons.attach_money_rounded,
          title: TripPlanStrings.totalCost,
           value: "${widget.trip.totalBudget ?? 0} EGP",
        ),
        const SizedBox(height: 10),
        _summaryRow(
          icon: Icons.access_time_rounded,
          title: TripPlanStrings.estimatedDuration,
           value: "${widget.trip.durationDays ?? 0} Days",
        ),
        const SizedBox(height: 10),
        _summaryRow(
          icon: Icons.location_on_outlined,
          title: TripPlanStrings.numberOfPlaces,
          value: "${widget.trip.placesCount ?? 0} Places",
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
        children: List.generate(widget.trip.tripPlaces?.length ??0, (index) {
          final stop = widget.trip.tripPlaces![index];
          final bool isLast = index == widget.trip.tripPlaces!.length - 1;
          return _buildTimelineRow(stop, isLast);
        }),
      ),
    );
  }

  Widget _buildTimelineRow(TripPlaces stop, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 52,
            child: Text(
              stop.startTime??"",
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

  Widget _buildStopCard(TripPlaces stop) {
    final place = stop.place!;
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
              place.mainImageUrl!.startsWith("http")
                  ? place.mainImageUrl!
                  : "https://implant-liberty-transfer.ngrok-free.dev${place.mainImageUrl}",
              width: 54,
              height: 54,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 54,
                height: 54,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    place?.name??"",
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: _AppColors.textDark,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 13,
                      color: _AppColors.textGrey,
                    ),
                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        "${stop.startTime} - ${stop.endTime}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: _AppColors.textGrey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

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
      // home: NewTripPlanScreen(trip: null,),
    );
  }
}


