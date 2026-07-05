import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------
/// CENTRALIZED STRINGS (for future localization/multi-language support)
/// ---------------------------------------------------------------------
class FavoriteStrings {
  static const String appBarTitle = 'Favorite';
  static const String searchHint = 'Search Favorite...';
  static const String emptyStateMessage = 'No favorite places found';
}

/// ---------------------------------------------------------------------
/// DATA MODEL
/// ---------------------------------------------------------------------
class FavoritePlaceModel {
  final String name;
  final String city;
  final int priceEgp;
  final String imageUrl;

  const FavoritePlaceModel({
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
  static const Color pageBackground = Color(0xFFF6F7F9);
  static const Color searchBg = Color(0xFFFFFFFF);
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  final List<FavoritePlaceModel> _favorites = [
    const FavoritePlaceModel(
      name: 'Great pyramids of Giza',
      city: 'Giza',
      priceEgp: 240,
      imageUrl:
      'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?w=200&q=80',
    ),
    const FavoritePlaceModel(
      name: 'The Great Sphinx',
      city: 'Giza',
      priceEgp: 240,
      imageUrl:
      'https://images.unsplash.com/photo-1539768942893-daf53e448371?w=200&q=80',
    ),
    const FavoritePlaceModel(
      name: 'Egyptian Museum',
      city: 'Cairo',
      priceEgp: 210,
      imageUrl:
      'https://images.unsplash.com/photo-1608731267464-c0c889c2ff02?w=200&q=80',
    ),
    const FavoritePlaceModel(
      name: 'Cairo Citadel',
      city: 'Cairo',
      priceEgp: 180,
      imageUrl:
      'https://images.unsplash.com/photo-1572252009286-268acec5ca0a?w=200&q=80',
    ),
  ];

  List<FavoritePlaceModel> get _filteredFavorites {
    if (_query.trim().isEmpty) return _favorites;
    final String lowerQuery = _query.toLowerCase();
    return _favorites
        .where(
          (place) =>
      place.name.toLowerCase().contains(lowerQuery) ||
          place.city.toLowerCase().contains(lowerQuery),
    )
        .toList();
  }

  void _removeFavorite(FavoritePlaceModel place) {
    setState(() => _favorites.remove(place));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final places = _filteredFavorites;

    return Scaffold(
      backgroundColor: _AppColors.pageBackground,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: _buildSearchBar(),
            ),
            Expanded(
              child: places.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildFavoriteCard(places[index]),
                  );
                },
              ),
            ),
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
        FavoriteStrings.appBarTitle,
        style: TextStyle(
          color: _AppColors.textDark,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // SEARCH BAR
  // ---------------------------------------------------------------
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: _AppColors.searchBg,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => setState(() => _query = value),
        style: const TextStyle(fontSize: 14, color: _AppColors.textDark),
        decoration: InputDecoration(
          hintText: FavoriteStrings.searchHint,
          hintStyle: const TextStyle(fontSize: 14, color: _AppColors.textGrey),
          prefixIcon: const Icon(Icons.search, color: _AppColors.textGrey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: _AppColors.searchBg,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // FAVORITE CARD
  // ---------------------------------------------------------------
  Widget _buildFavoriteCard(FavoritePlaceModel place) {
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
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red, size: 24),
            onPressed: () => _removeFavorite(place),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // EMPTY STATE
  // ---------------------------------------------------------------
  Widget _buildEmptyState() {
    return Center(
      child: Text(
        FavoriteStrings.emptyStateMessage,
        style: const TextStyle(fontSize: 14, color: _AppColors.textGrey),
      ),
    );
  }
}

/// ---------------------------------------------------------------------
/// ENTRY POINT (for standalone preview / testing)
/// ---------------------------------------------------------------------
class FavoriteApp extends StatelessWidget {
  const FavoriteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const FavoriteScreen(),
    );
  }
}

void main() {
  runApp(const FavoriteApp());
}