import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------
/// DATA MODEL
/// ---------------------------------------------------------------------
class PlaceDetailModel {
  final String title;
  final String city;
  final String description;
  final String visitors;
  final String price;
  final String openingHours;
  final String headerImage;
  final List<String> galleryImages;

  const PlaceDetailModel({
    required this.title,
    required this.city,
    required this.description,
    required this.visitors,
    required this.price,
    required this.openingHours,
    required this.headerImage,
    required this.galleryImages,
  });
}

/// ---------------------------------------------------------------------
/// MOCK DATA
/// ---------------------------------------------------------------------
final PlaceDetailModel mockPlaceDetail = PlaceDetailModel(
  title: 'Great pyramids of Giza',
  city: 'Giza',
  visitors: '12K Visitors',
  description:
  'The Great Sphinx is a limestone statue of a reclining sphinx, '
      'a mythical creature with the head of a human and the body of a '
      'lion. It is the oldest known monumental sculpture in Egypt and '
      'one of the most recognizable statues in the world.',
  price: '240 EGP',
  openingHours: '8:00 AM - 5:00 PM',
  headerImage:
  'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?w=800&q=80',
  galleryImages: [
    'https://images.unsplash.com/photo-1539768942893-daf53e448371?w=400&q=80',
    'https://images.unsplash.com/photo-1568322445389-f64ac9c7d449?w=400&q=80',
    'https://images.unsplash.com/photo-1568402102990-bc541580b59f?w=400&q=80',
    'https://images.unsplash.com/photo-1553913861-c0fddf2619ee?w=400&q=80',
  ],
);

/// ---------------------------------------------------------------------
/// THEME CONSTANTS
/// ---------------------------------------------------------------------
class _AppColors {
  static const Color darkBlue = Color(0xFF0B3D91);
  static const Color primaryBlue = Color(0xFF1565D8);
  static const Color iconBg = Color(0xFFEAF1FF);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF7C7C7C);
  static const Color divider = Color(0xFFE9E9E9);
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class PlaceDetailsScreen extends StatelessWidget {
  final PlaceDetailModel place;

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final headerHeight = size.height * 0.32;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderImage(context, headerHeight),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleRow(),
                      const SizedBox(height: 8),
                      _buildVisitorsRow(),
                      const SizedBox(height: 20),
                      const Divider(color: _AppColors.divider, height: 1),
                      const SizedBox(height: 20),
                      _buildSectionTitle('Historical Background'),
                      const SizedBox(height: 10),
                      _buildDescription(),
                      const SizedBox(height: 20),
                      const Divider(color: _AppColors.divider, height: 1),
                      const SizedBox(height: 16),
                      _buildInfoRow(
                        icon: Icons.attach_money_rounded,
                        label: 'Ticket Price',
                        value: place.price,
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow(
                        icon: Icons.access_time_rounded,
                        label: 'Opening Hours',
                        value: place.openingHours,
                      ),
                      const SizedBox(height: 24),
                      _buildGallerySectionHeader(),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                _buildGalleryList(),
              ],
            ),
          ),

          // Fixed bottom button
          _buildBottomButton(context),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // HEADER IMAGE + GRADIENT + BACK/FAVORITE BUTTONS
  // ---------------------------------------------------------------
  Widget _buildHeaderImage(BuildContext context, double height) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/pyramids.png',
            fit: BoxFit.cover,
          ),
          // Gradient overlay for readability of icons
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black45,
                  Colors.transparent,
                  Colors.black26,
                ],
                stops: [0.0, 0.4, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleIconButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.maybePop(context),
                  ),
                  _circleIconButton(
                    icon: Icons.favorite_border_rounded,
                    onTap: () {
                      debugPrint('Favorite tapped');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  // ---------------------------------------------------------------
  // TITLE ROW (Title + City instead of original price)
  // ---------------------------------------------------------------
  Widget _buildTitleRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            place.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _AppColors.textDark,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: _AppColors.iconBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_city_rounded,
                size: 15,
                color: _AppColors.primaryBlue,
              ),
              const SizedBox(width: 4),
              Text(
                place.city,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _AppColors.primaryBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVisitorsRow() {
    return Row(
      children: [
        const Icon(Icons.people_alt_outlined,
            size: 16, color: _AppColors.textGrey),
        const SizedBox(width: 6),
        Text(
          place.visitors,
          style: const TextStyle(fontSize: 13, color: _AppColors.textGrey),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------
  // SECTION HELPERS
  // ---------------------------------------------------------------
  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: _AppColors.textDark,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      place.description,
      style: const TextStyle(
        fontSize: 13.5,
        height: 1.5,
        color: _AppColors.textGrey,
      ),
    );
  }

  Widget _buildInfoRow({
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
              style: const TextStyle(
                fontSize: 12,
                color: _AppColors.textGrey,
              ),
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

  Widget _buildGallerySectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSectionTitle('Gallery'),
        GestureDetector(
          onTap: () {
            debugPrint('See all gallery tapped');
          },
          child: const Text(
            'See all',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _AppColors.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGalleryList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: place.galleryImages.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              place.galleryImages[index],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 100,
                height: 100,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image_outlined),
              ),
            ),
          );
        },
      ),
    );
  }

  // ---------------------------------------------------------------
  // BOTTOM FIXED BUTTON
  // ---------------------------------------------------------------
  Widget _buildBottomButton(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
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
              backgroundColor: _AppColors.darkBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            onPressed: () {
              // TODO: Hook up "Add to My Trip" action
              debugPrint('Add to My Trip tapped for ${place.title}');
            },
            child: const Text(
              'Add to My Trip',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

