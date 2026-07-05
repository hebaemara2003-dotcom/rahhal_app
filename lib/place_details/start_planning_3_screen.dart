import 'package:flutter/material.dart';
import 'package:rahhal_app/place_details/new_trip_plan_screen.dart';
import '../api/places_api.dart' as PlacesApi;
import 'places_api.dart';

/// ---------------------------------------------------------------------
/// DATA MODEL
/// ---------------------------------------------------------------------
class RecommendedPlaceModel {
  final String name;
  final String price;
  final String imageUrl;

  const RecommendedPlaceModel({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

/// ---------------------------------------------------------------------
/// MOCK DATA
/// ---------------------------------------------------------------------
final List<RecommendedPlaceModel> mockRecommendedPlaces = [
  const RecommendedPlaceModel(
    name: 'Great pyramids of Giza',
    price: '240 EGP',
    imageUrl:
    'assets/images/pyramids_small.png',
  ),
  const RecommendedPlaceModel(
    name: 'Egyption Museum',
    price: '200 EGP',
    imageUrl:
    'assets/images/museum.png',
  ),
];

/// ---------------------------------------------------------------------
/// THEME CONSTANTS
/// ---------------------------------------------------------------------
class _AppColors {
  static const Color activeStep = Color(0xFF004F71);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF8A8A8A);
  static const Color priceColor = Color(0xFF6C7A93);
  static const Color primaryButton = Color(0xFF005BEA);
  static const Color pageBackground = Color(0xFFF6F7F9);
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class RecommendedPlacesScreen extends StatelessWidget {
  final List<RecommendedPlaceModel> places;

  const RecommendedPlacesScreen({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AppColors.pageBackground,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressIndicator(),
                  const SizedBox(height: 26),
                  _buildSectionHeader(),
                  const SizedBox(height: 14),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return _buildPlaceCard(places[index]);
                },
              ),
            ),
            _buildBottomActions(context),
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
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.08),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: _AppColors.textDark),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: const Text(
        'Start Planning',
        style: TextStyle(
          color: _AppColors.textDark,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // STEP PROGRESS BAR (all 3 active - final step)
  // ---------------------------------------------------------------
  Widget _buildProgressIndicator() {
    return Row(
      children: List.generate(3, (index) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: index != 2 ? 8 : 0),
            height: 4,
            decoration: BoxDecoration(
              color: _AppColors.activeStep,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }

  // ---------------------------------------------------------------
  // SECTION HEADER
  // ---------------------------------------------------------------
  Widget _buildSectionHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Places',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: _AppColors.textDark,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Based on your budget and interests',
          style: TextStyle(
            fontSize: 13,
            color: _AppColors.textGrey,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------
  // PLACE CARD
  // ---------------------------------------------------------------
  Widget _buildPlaceCard(RecommendedPlaceModel place) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              place.imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 64,
                height: 64,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  place.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: _AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  place.price,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: _AppColors.priceColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // BOTTOM ACTION BUTTONS
  // ---------------------------------------------------------------
  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
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
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _AppColors.primaryButton,
                shape: const StadiumBorder(),
                elevation: 0,
              ),
              onPressed: () {
                debugPrint('Generate Trip Plan tapped');
              },
              child: const Text(
                'Generate Trip Plan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _AppColors.primaryButton,
                shape: const StadiumBorder(),
                elevation: 0,
              ),
              onPressed: () async {
                Map<String, dynamic> body = {
                  "city": "Cairo",
                  "durationDays": 2,
                  "category": "Coptic",
                  "budget": 400,
                  "isEgyptian": true,
                  "isStudent": true,
                  "language": "en",
                  "travelersCount": 2
                };
                try {
                  // 1. بننادي الـ API والداتا بترجع
                  var responseData = await PlacesApi.generateTripItinerary(requestBody: body);

                  if (responseData != null) {
                    print("الرد وصل تمام وجاري التحويل للموديل...");

                    // 2. بنترجم الـ Map اللي راجعة لـ Model عشان الشاشة الجديدة تفهمها
                    TripPlanModel planModel = TripPlanModel.fromJson(responseData);

                    // 3. بننقل للشاشة الجديدة وبنبعت لها الـ Model المترجم
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewTripPlanScreen(tripPlan: planModel),
                      ),
                    );
                  }
                } catch (e) {
                  print("خطأ في الاتصال أو التحويل: $e");
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'View on Map',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: _AppColors.primaryButton, width: 1.4),
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                debugPrint('Back to Home tapped');
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _AppColors.primaryButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



/// ---------------------------------------------------------------------
/// ENTRY POINT (for standalone preview / testing)
/// ---------------------------------------------------------------------
class RecommendedPlacesApp extends StatelessWidget {
  const RecommendedPlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: RecommendedPlacesScreen(places: mockRecommendedPlaces),
    );
  }
}

void main() {
  runApp(const RecommendedPlacesApp());
}