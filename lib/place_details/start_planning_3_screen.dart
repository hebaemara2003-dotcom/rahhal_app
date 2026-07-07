import 'package:flutter/material.dart';
import 'package:rahhal_app/place_details/new_trip_plan_screen.dart';
import 'package:rahhal_app/utils/screen_size.dart';

import '../api/generate_itinerary_api.dart';
import '../model_api/generate_itinerary/generate_itinerary_request.dart';
import '../model_api/generate_itinerary/generate_itinerary_response.dart';
import 'new_trip_screen.dart';

  class RecommendedPlacesScreen extends StatefulWidget {
  final String city;
  final String duration;
  final String travelers;
  final List<String> interests;
  final double budget;

  const RecommendedPlacesScreen({
  super.key,
  required this.city,
  required this.duration,
  required this.travelers,
  required this.interests,
  required this.budget,
  });

  @override
  State<RecommendedPlacesScreen> createState() => _RecommendedPlacesScreenState();
}

class _RecommendedPlacesScreenState extends State<RecommendedPlacesScreen> {
  GenerateItineraryResponse? itineraryResponse;
  @override
  void initState() {
    super.initState();

    getItinerary();
  }
  Future<void> getItinerary() async {
    setState(() {
      isLoading = true;
    });

    GenerateItineraryRequest request = GenerateItineraryRequest(
      city: widget.city,
      durationDays: widget.duration == "1 Day"
          ? 1
          : widget.duration == "2-3 Days"
          ? 2
          : 4,
      category: widget.interests.first,
      budget: widget.budget,
      travelersCount: int.parse(widget.travelers.split(" ").first),
      isEgyptian: true,
      isStudent: true,
      language: "en",
    );

    // استدعاء الـ API
    itineraryResponse = await generateItinerary(request);

    // التحقق من النتيجة
    if (itineraryResponse?.data == null) {
      setState(() {
        isLoading = false;
      });

      debugPrint(itineraryResponse?.message ?? "Unknown Error");
      return;
    }

    print(itineraryResponse!.data!.tripPlaces!.length);

    for (var place in itineraryResponse!.data!.tripPlaces!) {
      print(place.place?.name);
    }

    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'Start Planning',
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[200],
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // 3-Segment Progress Indicator Steps
              Row(
                children: [
                  Expanded(child: Container(height: 4, decoration: BoxDecoration(color: const Color(0xFF0056C6), borderRadius: BorderRadius.circular(2)))),
                  const SizedBox(width: 12),
                  Expanded(child: Container(height: 4, decoration: BoxDecoration(color: const Color(0xFF0056C6), borderRadius: BorderRadius.circular(2)))),
                  const SizedBox(width: 12),
                  Expanded(child: Container(height: 4, decoration: BoxDecoration(color: const Color(0xFF0056C6), borderRadius: BorderRadius.circular(2)))),
                ],
              ),
              const SizedBox(height: 35),

              // Title and Subtitle Texts
              const Text(
                'Recommended Places',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                'Based on your budget and interests',
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              ),
              const SizedBox(height: 24),

              // Recommended Cards List View Setup
              Expanded(
                child: isLoading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                  itemCount:
                  itineraryResponse?.data?.tripPlaces?.length ?? 0,
                  itemBuilder: (context, index) {
                    final tripPlace =
                    itineraryResponse!.data!.tripPlaces![index];

                    return _buildRecommendedCard(
                      tripPlace.place?.name ?? "",
                      "${tripPlace.place?.price ?? 0} EGP",
                      tripPlace.place?.mainImageUrl ?? "",
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0056C6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    if (itineraryResponse?.data == null) return;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>NewTripPlanScreen(
                            trip: itineraryResponse!.data!)
                      ),
                    );
                  },
                  icon: const Icon(Icons.location_on, color: Colors.white, size: 20),
                  label: const Text('View on Map', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF0056C6), width: 1.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: () {},
                  child: const Text('Back to Home', style: TextStyle(color: Color(0xFF0056C6), fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedCard(String name, String price, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl.startsWith("http")
                    ? imageUrl
                    : "https://implant-liberty-transfer.ngrok-free.dev$imageUrl",
                width: 80,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: context.width*0.3,
                    height: context.height*0.2,
                    color: Colors.grey.shade300,
                  );
                },
              ),
            ),
             SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${price} EGP",
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}