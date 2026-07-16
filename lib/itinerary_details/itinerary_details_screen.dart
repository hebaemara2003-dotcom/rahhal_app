import 'package:flutter/material.dart';
import 'package:rahhal_app/place_details/new_trip_screen.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/utils/screen_size.dart';

import '../api/itinerary_details_api.dart';
import '../model_api/itnerary_details/itnerary_details_response.dart';

  class ItineraryDetailsScreen extends StatefulWidget {
  final int tripId;

  const ItineraryDetailsScreen({
  super.key,
  required this.tripId,
  });

  @override
  State<ItineraryDetailsScreen> createState() =>
  _ItineraryDetailsScreenState();
  }

class _ItineraryDetailsScreenState extends State<ItineraryDetailsScreen> {

  ItneraryDetailsResponse? trip;
  @override
  @override
  void initState() {
    super.initState();
    loadTrip();
  }

  Future<void> loadTrip() async {
    print("Trip Id = ${widget.tripId}");

    trip = await getTripDetails(widget.tripId);

    print(trip);

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    // الألوان المعتمدة من التصميم
    const primaryColor = Color(0xFF0056B3); // الأزرق الملكي للأزرار والأيقونات
    const accentContainerColor = Color(0xFFE7F1FF); // خلفية أيقونات الميزات الخفيفة
    const backgroundColor = Color(0xFFF8F9FA); // خلفية التطبيق الهادئة

    if (trip == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Itinerary Details',
          style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // المحتوى القابل للتمرير
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 1. الجزء العلوي: الصورة مع زر المفضلة (القلب)
                  Stack(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        child: Image.asset(AppAssets.generalImage,
                        width: context.width*.3,
                        height: context.height*.15,),
                      ),
                      // زر القلب الأبيض أعلى اليمين
                      Positioned(
                        top: 16,
                        right: 20,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.white, size: 28),
                          onPressed: () {
                            // حدث إضافة للمفضلة
                          },
                        ),
                      ),
                    ],
                  ),

                  // 2. بطاقة التفاصيل المتداخلة (Overlap Card)
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // اسم الرحلة الرئيسي
                        Text(
                        trip!.tripName ?? "",
    style: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Color(0xFF212529),
    ),

                          ),

                          const SizedBox(height: 6),
                          const Divider(color: Colors.black12),


                          const SizedBox(height: 8),



                          // قائمة الميزات التوضيحية
                          _buildFeatureRow(
                            Icons.attach_money_rounded,
                            'Ticket Price',
                            "${trip!.totalBudget} EGP",
                            accentContainerColor,
                            primaryColor,
                          ),
                          const SizedBox(height: 16),
                          _buildFeatureRow(
                            Icons.access_time_rounded,
                            'Duration',
                            "${trip!.durationDays} Days",
                            accentContainerColor,
                            primaryColor,
                          ),
                          const SizedBox(height: 16),
                          _buildFeatureRow(
                            Icons.location_on_outlined,
                            'Places',
                            "${trip!.placesCount} Places",
                            accentContainerColor,
                            primaryColor,
                          ),
                          const SizedBox(height: 24),
                          const Divider(color: Colors.black12),
                          const SizedBox(height: 20),

                          // قسم Places Included
                          const Text(
                            'Places Included',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF212529),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // عرض الكروت مباشرة بدون خط الـ Timeline الزمني حسب الصورة الجديدة
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: trip!.tripPlaces?.length ?? 0,
                            itemBuilder: (context, index) {
                              final item = trip!.tripPlaces![index];

                              return _buildPlaceCard(
                                title: item.place?.name ?? "Unknown Place",
                                duration:
                                "${item.startTime ?? ""} - ${item.endTime ?? ""}",
                                imageUrl: item.place?.mainImageUrl ?? "",
                              );
                            },
                          ),
                          const SizedBox(height: 80), // مساحة أمان للزر السفلي
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. زر الإجراء السفلي الثابت (Sticky Button)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_)=>
                      NewTripScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.business_center_outlined, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Add to My Trip',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ودجت بناء صفوف الميزات (السعر، المدة، المواقع)
  Widget _buildFeatureRow(IconData icon, String label, String value, Color bgColor, Color iconColor) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF212529)),
            ),
          ],
        ),
      ],
    );
  }

  // ودجت مخصصة لبناء الكارت العادي النظيف لكل مزار سياحي بدون الـ Timeline
  Widget _buildPlaceCard({
    required String title,
    required String duration,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // صورة المزار
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 75,
              height: 75,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 75,
                height: 75,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // تفاصيل المزار السياحي والوقت المتوقع له
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212529),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      duration,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
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
}