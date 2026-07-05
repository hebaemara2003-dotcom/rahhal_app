import 'package:flutter/material.dart';

// ============================================================
// STRINGS
// ============================================================
class AdminPlacesStrings {
  static const String appBarTitle = 'Admin places';
  static const String sectionTitle = 'Places Management';
  static const String addPlaceButton = '+ Add place';
  static const String searchHint = 'Search places by name or city...';

  // Table headers
  static const String columnPlace = 'Place';
  static const String columnCategory = 'Category';
  static const String columnLocation = 'Location';
  static const String columnPrice = 'Price (EGP)';
  static const String columnAction = 'Action';

  // Sample data strings
  static const String placeName = 'The Great pyramids of Giza';
  static const String categoryHistorical = 'Historical';
  static const String cityGiza = 'Giza';
  static const String priceEgyptianLabel = 'Egyptian: 60';
  static const String priceForeignLabel = 'foreign: 200';
  static const String priceStudentLabel = 'Student: 30';
}

// ============================================================
// COLORS & STYLES
// ============================================================
class AdminPlacesColors {
  static const Color scaffoldBackground = Color(0xFFF3F4F6);
  static const Color appBarBackground = Colors.white;
  static const Color appBarDivider = Color(0xFFE5E7EB);
  static const Color appBarTitleColor = Color(0xFF111827);

  static const Color panelBackground = Colors.white;
  static const Color sectionTitleColor = Color(0xFF111827);

  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color addButtonTextColor = Colors.white;

  static const Color searchFillColor = Color(0xFFF3F4F6);
  static const Color searchIconColor = Color(0xFF9CA3AF);
  static const Color searchHintColor = Color(0xFF9CA3AF);
  static const Color searchTextColor = Color(0xFF111827);

  static const Color tableHeaderTextColor = Color(0xFF9CA3AF);
  static const Color tableRowDivider = Color(0xFFF1F1F3);

  static const Color placeNameColor = Color(0xFF111827);
  static const Color categoryTextColor = Color(0xFF60A5FA);
  static const Color locationIconColor = Color(0xFF9CA3AF);
  static const Color locationTextColor = Color(0xFF374151);
  static const Color priceTextColor = Color(0xFF111827);

  static const Color editIconColor = Color(0xFF2563EB);
  static const Color deleteIconColor = Color(0xFFDC2626);

  static const Color imagePlaceholderStart = Color(0xFFFBBF24);
  static const Color imagePlaceholderEnd = Color(0xFFF59E0B);

  static const TextStyle appBarTitleStyle = TextStyle(
    color: appBarTitleColor,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle sectionTitleStyle = TextStyle(
    color: sectionTitleColor,
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle addButtonTextStyle = TextStyle(
    color: addButtonTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle searchHintStyle = TextStyle(
    color: searchHintColor,
    fontSize: 14,
  );

  static const TextStyle tableHeaderStyle = TextStyle(
    color: tableHeaderTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle placeNameStyle = TextStyle(
    color: placeNameColor,
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle categoryTextStyle = TextStyle(
    color: categoryTextColor,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle locationTextStyle = TextStyle(
    color: locationTextColor,
    fontSize: 13,
  );

  static const TextStyle priceTextStyle = TextStyle(
    color: priceTextColor,
    fontSize: 12.5,
    height: 1.5,
  );
}

// ============================================================
// DATA MODEL
// ============================================================
class AdminPlaceItem {
  final String name;
  final String category;
  final String city;
  final int egyptianPrice;
  final int foreignPrice;
  final int studentPrice;

  const AdminPlaceItem({
    required this.name,
    required this.category,
    required this.city,
    required this.egyptianPrice,
    required this.foreignPrice,
    required this.studentPrice,
  });
}

// ============================================================
// SCREEN
// ============================================================
class AdminPlacesScreen extends StatefulWidget {
  const AdminPlacesScreen({super.key});

  @override
  State<AdminPlacesScreen> createState() => _AdminPlacesScreenState();
}

class _AdminPlacesScreenState extends State<AdminPlacesScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<AdminPlaceItem> _places = List.generate(
    6,
        (_) => const AdminPlaceItem(
      name: AdminPlacesStrings.placeName,
      category: AdminPlacesStrings.categoryHistorical,
      city: AdminPlacesStrings.cityGiza,
      egyptianPrice: 60,
      foreignPrice: 200,
      studentPrice: 30,
    ),
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onAddPlacePressed() {
    // TODO: Hook up navigation or modal for adding a new place.
  }

  void _onEditPressed(int index) {
    // TODO: Hook up edit flow for _places[index].
  }

  void _onDeletePressed(int index) {
    setState(() {
      _places.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdminPlacesColors.scaffoldBackground,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeaderRow(),
              const SizedBox(height: 16),
              _buildSearchField(),
              const SizedBox(height: 16),
              Expanded(child: _buildMainPanel()),
            ],
          ),
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
          color: AdminPlacesColors.appBarBackground,
          border: Border(
            bottom: BorderSide(
              color: AdminPlacesColors.appBarDivider,
              width: 1,
            ),
          ),
        ),
        child: AppBar(
          backgroundColor: AdminPlacesColors.appBarBackground,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            AdminPlacesStrings.appBarTitle,
            style: AdminPlacesColors.appBarTitleStyle,
          ),
        ),
      ),
    );
  }

  // ---------------- Header Row ----------------
  Widget _buildHeaderRow() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            AdminPlacesStrings.sectionTitle,
            style: AdminPlacesColors.sectionTitleStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 12),
        _buildAddPlaceButton(),
      ],
    );
  }

  Widget _buildAddPlaceButton() {
    return ElevatedButton(
      onPressed: _onAddPlacePressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AdminPlacesColors.primaryBlue,
        foregroundColor: AdminPlacesColors.addButtonTextColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        AdminPlacesStrings.addPlaceButton,
        style: AdminPlacesColors.addButtonTextStyle,
      ),
    );
  }

  // ---------------- Search Field ----------------
  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      style: const TextStyle(
        color: AdminPlacesColors.searchTextColor,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: AdminPlacesStrings.searchHint,
        hintStyle: AdminPlacesColors.searchHintStyle,
        prefixIcon: const Icon(
          Icons.search,
          color: AdminPlacesColors.searchIconColor,
        ),
        filled: true,
        fillColor: AdminPlacesColors.searchFillColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ---------------- Main Panel ----------------
  Widget _buildMainPanel() {
    return Container(
      decoration: BoxDecoration(
        color: AdminPlacesColors.panelBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTableHeader(),
          const SizedBox(height: 8),
          const Divider(height: 1, color: AdminPlacesColors.tableRowDivider),
          Expanded(
            child: _places.isEmpty
                ? const Center(child: Text('No places found'))
                : ListView.separated(
              padding: const EdgeInsets.only(top: 4),
              itemCount: _places.length,
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                color: AdminPlacesColors.tableRowDivider,
              ),
              itemBuilder: (context, index) {
                return _AdminPlaceRow(
                  item: _places[index],
                  onEdit: () => _onEditPressed(index),
                  onDelete: () => _onDeletePressed(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Table Header ----------------
  Widget _buildTableHeader() {
    return const Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            AdminPlacesStrings.columnPlace,
            style: AdminPlacesColors.tableHeaderStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            AdminPlacesStrings.columnCategory,
            style: AdminPlacesColors.tableHeaderStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            AdminPlacesStrings.columnLocation,
            style: AdminPlacesColors.tableHeaderStyle,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            AdminPlacesStrings.columnPrice,
            style: AdminPlacesColors.tableHeaderStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            AdminPlacesStrings.columnAction,
            style: AdminPlacesColors.tableHeaderStyle,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// PRIVATE ROW WIDGET
// ============================================================
class _AdminPlaceRow extends StatelessWidget {
  final AdminPlaceItem item;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _AdminPlaceRow({
    required this.item,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: _buildPlaceCell()),
          Expanded(flex: 2, child: _buildCategoryCell()),
          Expanded(flex: 2, child: _buildLocationCell()),
          Expanded(flex: 3, child: _buildPriceCell()),
          Expanded(flex: 2, child: _buildActionCell()),
        ],
      ),
    );
  }

  Widget _buildPlaceCell() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageThumbnail(),
        const SizedBox(height: 6),
        Text(
          item.name,
          style: AdminPlacesColors.placeNameStyle,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildImageThumbnail() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AdminPlacesColors.imagePlaceholderStart,
            AdminPlacesColors.imagePlaceholderEnd,
          ],
        ),
      ),
      child: const Icon(
        Icons.image_outlined,
        color: Colors.white,
        size: 18,
      ),
    );
  }

  Widget _buildCategoryCell() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        item.category,
        style: AdminPlacesColors.categoryTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildLocationCell() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 14,
            color: AdminPlacesColors.locationIconColor,
          ),
          Text(
            item.city,
            style: AdminPlacesColors.locationTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceCell() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        'Egyptian: ${item.egyptianPrice}\n'
            'foreign: ${item.foreignPrice}\n'
            'Student: ${item.studentPrice}',
        style: AdminPlacesColors.priceTextStyle,
      ),
    );
  }

  Widget _buildActionCell() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onEdit,
            borderRadius: BorderRadius.circular(6),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.edit,
                size: 16,
                color: AdminPlacesColors.editIconColor,
              ),
            ),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: onDelete,
            borderRadius: BorderRadius.circular(6),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.delete,
                size: 16,
                color: AdminPlacesColors.deleteIconColor,
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
class AdminPlacesApp extends StatelessWidget {
  const AdminPlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const AdminPlacesScreen(),
    );
  }
}

void main() {
  runApp(const AdminPlacesApp());
}