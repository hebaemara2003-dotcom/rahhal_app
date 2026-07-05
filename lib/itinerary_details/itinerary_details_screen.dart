import 'package:flutter/material.dart';

class ItineraryStopModel {
  final String time;
  final String placeName;
  final String duration;
  final String imageUrl;

  const ItineraryStopModel({
    required this.time,
    required this.placeName,
    required this.duration,
    required this.imageUrl,
  });
}

class ItineraryModel {
  final String title;
  final String subtitle;
  final String coverImageUrl;
  final String ticketPrice;
  final String durationLabel;
  final String placesCount;
  final List<ItineraryStopModel> stops;

  const ItineraryModel({
    required this.title,
    required this.subtitle,
    required this.coverImageUrl,
    required this.ticketPrice,
    required this.durationLabel,
    required this.placesCount,
    required this.stops,
  });
}

final ItineraryModel mockItinerary = ItineraryModel(
  title: 'Cairo in One Day',
  subtitle: 'Explore the best of Cairo in just one day!',
  coverImageUrl: 'assets/images/pyramids.png',
  ticketPrice: '500 EGP',
  durationLabel: '1 Day',
  placesCount: '4 Places',
  stops: const [
    ItineraryStopModel(
      time: '09:00 AM',
      placeName: 'Great pyramids of Giza',
      duration: '2.0 Hours',
      imageUrl: 'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?w=200&q=80',
    ),
    ItineraryStopModel(
      time: '11:30 AM',
      placeName: 'The Great Sphinx',
      duration: '1.5 Hours',
      imageUrl: 'https://images.unsplash.com/photo-1539768942893-daf53e448371?w=200&q=80',
    ),
    ItineraryStopModel(
      time: '02:00 PM',
      placeName: 'Egyptian Museum',
      duration: '2.0 Hours',
      imageUrl: 'https://images.unsplash.com/photo-1608731267464-c0c889c2ff02?w=200&q=80',
    ),
    ItineraryStopModel(
      time: '04:30 PM',
      placeName: 'Cairo Citadel',
      duration: '1.5 Hours',
      imageUrl: 'https://images.unsplash.com/photo-1572252009286-268acec5ca0a?w=200&q=80',
    ),
  ],
);

class _AppColors {
  static const Color primaryBlue = Color(0xFF005BEA);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF8A8A8A);
  static const Color iconBg = Color(0xFFEFF2F6);
  static const Color cardBorder = Color(0xFFEDEDED);
  static const Color divider = Color(0xFFEDEDED);
}

class ItineraryDetailsScreen extends StatelessWidget {
  final ItineraryModel itinerary;

  const ItineraryDetailsScreen({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderImage(context),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTripOverview(),
                  const SizedBox(height: 18),
                  const Divider(color: _AppColors.divider, height: 1),
                  const SizedBox(height: 18),
                  _buildQuickStats(),
                  const SizedBox(height: 20),
                  const Divider(color: _AppColors.divider, height: 1),
                  const SizedBox(height: 20),
                  const Text(
                    'Places Included',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTimeline(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButton(context),
    );
  }
  Widget _buildHeaderImage(BuildContext context) {
    final double headerHeight = MediaQuery.of(context).size.height * 0.28;
    return SizedBox(
      width: double.infinity,
      height: headerHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ),
            child: Image.asset(
              itinerary.coverImageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.05),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleButton(
                      icon: Icons.arrow_back_ios_new_rounded,
                      onTap: () => Navigator.maybePop(context),
                    ),
                    const Text(
                      'Itinerary Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    _circleButton(
                      icon: Icons.favorite_border_rounded,
                      onTap: () {},
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

  Widget _circleButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: _AppColors.textDark, size: 18),
      ),
    );
  }

  Widget _buildTripOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
      itinerary.title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _AppColors.textDark,
      ),
    ),
    const SizedBox(height: 6),
    Text(
    itinerary.subtitle,style: const TextStyle(fontSize: 13.5, color: _AppColors.textGrey),
    ),
        const SizedBox(height: 16),
        const Text(
          'About This Trip',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: _AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Discover the most iconic landmarks in Cairo, from the majestic '
              'pyramids to the treasures of the Egyptian Museum.',
          style: TextStyle(
            fontSize: 13.5,
            height: 1.5,
            color: _AppColors.textGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickStats() {
    return Column(
      children: [
        _statRow(
          icon: Icons.attach_money_rounded,
          label: 'Ticket Price',
          value: itinerary.ticketPrice,
        ),
        const SizedBox(height: 14),
        _statRow(
          icon: Icons.access_time_rounded,
          label: 'Duration',
          value: itinerary.durationLabel,
        ),
        const SizedBox(height: 14),
        _statRow(
          icon: Icons.location_on_outlined,
          label: 'Places',
          value: itinerary.placesCount,
        ),
      ],
    );
  }

  Widget _statRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: _AppColors.iconBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: _AppColors.primaryBlue, size: 22),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: _AppColors.textGrey),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _AppColors.textDark,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: List.generate(itinerary.stops.length, (index) {
        final stop = itinerary.stops[index];
        final bool isLast = index == itinerary.stops.length - 1;
        return _buildTimelineRow(stop, isLast);
      }),
    );
  }

  Widget _buildTimelineRow(ItineraryStopModel stop, bool isLast) {
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
  Widget _buildStopCard(ItineraryStopModel stop) {
    return Container(
      padding: const EdgeInsets.all(10),
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
                      stop.duration,
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

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        14,
        20,
        14 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _AppColors.primaryBlue,
            shape: const StadiumBorder(),
            elevation: 0,
          ),
          onPressed: () {
            debugPrint('Add to My Trip tapped for ${itinerary.title}');
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.card_travel_rounded, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                'Add to My Trip',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItineraryDetailsApp extends StatelessWidget {
  const ItineraryDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: ItineraryDetailsScreen(itinerary: mockItinerary),
    );
  }
}

void main() {
  runApp(const ItineraryDetailsApp());
}