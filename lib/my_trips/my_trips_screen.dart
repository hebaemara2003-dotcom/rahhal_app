import 'package:flutter/material.dart';

// ============================================================
// STRINGS
// ============================================================
class MyTripsStrings {
  static const String appBarTitle = 'My Trips';

  static const String filterAll = 'All';
  static const String filterCompleted = 'Completed';
  static const String filterUpcoming = 'Upcoming';

  static const String statusUpcoming = 'Upcoming';
  static const String statusCompleted = 'Completed';

  static const String viewDetails = 'View Details';
  static const String createNewTrip = '+ Create New Trip';

  static const String emptyStateMessage = 'No trips found for this filter';

  // Sample trip data strings
  static const String tripCairoTitle = 'Cairo in One Day';
  static const String tripCairoLocation = 'Cairo, Egypt';
  static const String tripCairoDate = 'May 20, 2025';

  static const String tripHurghadaTitle = 'Hurghada Weekend';
  static const String tripHurghadaLocation = 'Hurghada, Egypt';
  static const String tripHurghadaDate = 'May 10-12, 2025';
}

// ============================================================
// ENUMS
// ============================================================
enum TripStatus { upcoming, completed }

enum TripFilter { all, completed, upcoming }

// ============================================================
// COLORS & STYLES
// ============================================================
class MyTripsColors {
  static const Color scaffoldBackground = Color(0xFFF3F4F6);
  static const Color appBarBackground = Colors.white;
  static const Color appBarShadow = Color(0x14000000);
  static const Color appBarTitleColor = Color(0xFF111827);

  static const Color filterBarBackground = Colors.white;
  static const Color filterIconColor = Color(0xFF2563EB);

  static const Color chipActiveBackground = Color(0xFF2563EB);
  static const Color chipActiveTextColor = Colors.white;
  static const Color chipInactiveBackground = Colors.transparent;
  static const Color chipInactiveTextColor = Color(0xFF6B7280);

  static const Color cardBackground = Colors.white;
  static const Color cardBorder = Color(0xFFF0F0F2);

  static const Color tripTitleColor = Color(0xFF111827);
  static const Color tripLocationColor = Color(0xFF6B7280);
  static const Color tripDateColor = Color(0xFF2563EB);

  static const Color statusUpcomingBackground = Color(0xFFF1E9FE);
  static const Color statusUpcomingTextColor = Color(0xFF8B5CF6);
  static const Color statusCompletedBackground = Color(0xFFDFF7E6);
  static const Color statusCompletedTextColor = Color(0xFF22C55E);

  static const Color viewDetailsBorder = Color(0xFF2563EB);
  static const Color viewDetailsTextColor = Color(0xFF2563EB);

  static const Color createTripBorder = Color(0xFF2563EB);
  static const Color createTripTextColor = Color(0xFF2563EB);
  static const Color createTripIconColor = Color(0xFF2563EB);

  static const Color imagePlaceholderSandStart = Color(0xFFF6C177);
  static const Color imagePlaceholderSandEnd = Color(0xFFE29B4A);
  static const Color imagePlaceholderSeaStart = Color(0xFF5FD0E0);
  static const Color imagePlaceholderSeaEnd = Color(0xFF2E86C1);

  static const TextStyle appBarTitleStyle = TextStyle(
    color: appBarTitleColor,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle chipActiveStyle = TextStyle(
    color: chipActiveTextColor,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle chipInactiveStyle = TextStyle(
    color: chipInactiveTextColor,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle tripTitleStyle = TextStyle(
    color: tripTitleColor,
    fontSize: 14.5,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle tripLocationStyle = TextStyle(
    color: tripLocationColor,
    fontSize: 12.5,
  );

  static const TextStyle tripDateStyle = TextStyle(
    color: tripDateColor,
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle statusChipStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle viewDetailsStyle = TextStyle(
    color: viewDetailsTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle createTripStyle = TextStyle(
    color: createTripTextColor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}

// ============================================================
// DATA MODEL
// ============================================================
class TripItem {
  final String title;
  final String location;
  final String date;
  final TripStatus status;
  final Gradient imageGradient;

  const TripItem({
    required this.title,
    required this.location,
    required this.date,
    required this.status,
    required this.imageGradient,
  });
}

// ============================================================
// SCREEN
// ============================================================
class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  TripFilter _activeFilter = TripFilter.all;

  static const Gradient _sandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      MyTripsColors.imagePlaceholderSandStart,
      MyTripsColors.imagePlaceholderSandEnd,
    ],
  );

  static const Gradient _seaGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      MyTripsColors.imagePlaceholderSeaStart,
      MyTripsColors.imagePlaceholderSeaEnd,
    ],
  );

  final List<TripItem> _trips = const [
    TripItem(
      title: MyTripsStrings.tripCairoTitle,
      location: MyTripsStrings.tripCairoLocation,
      date: MyTripsStrings.tripCairoDate,
      status: TripStatus.upcoming,
      imageGradient: _sandGradient,
    ),
    TripItem(
      title: MyTripsStrings.tripHurghadaTitle,
      location: MyTripsStrings.tripHurghadaLocation,
      date: MyTripsStrings.tripHurghadaDate,
      status: TripStatus.completed,
      imageGradient: _seaGradient,
    ),
    TripItem(
      title: MyTripsStrings.tripCairoTitle,
      location: MyTripsStrings.tripCairoLocation,
      date: MyTripsStrings.tripCairoDate,
      status: TripStatus.upcoming,
      imageGradient: _sandGradient,
    ),
    TripItem(
      title: MyTripsStrings.tripHurghadaTitle,
      location: MyTripsStrings.tripHurghadaLocation,
      date: MyTripsStrings.tripHurghadaDate,
      status: TripStatus.completed,
      imageGradient: _seaGradient,
    ),
  ];

  List<TripItem> get _filteredTrips {
    switch (_activeFilter) {
      case TripFilter.all:
        return _trips;
      case TripFilter.completed:
        return _trips
            .where((trip) => trip.status == TripStatus.completed)
            .toList();
      case TripFilter.upcoming:
        return _trips
            .where((trip) => trip.status == TripStatus.upcoming)
            .toList();
    }
  }

  void _onFilterSelected(TripFilter filter) {
    setState(() {
      _activeFilter = filter;
    });
  }

  void _onFilterIconPressed() {
    // TODO: Hook up advanced filter/sort options sheet.
  }

  void _onViewDetailsPressed(TripItem trip) {
    // TODO: Navigate to trip details screen for the given trip.
  }

  void _onCreateNewTripPressed() {
    // TODO: Navigate to the create-trip flow.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTripsColors.scaffoldBackground,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: _buildFilterBar(),
            ),
            Expanded(child: _buildTripsList()),
            _buildCreateTripBar(),
          ],
        ),
      ),
    );
  }

  // ---------------- AppBar ----------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: MyTripsColors.appBarBackground,
      elevation: 2,
      shadowColor: MyTripsColors.appBarShadow,
      centerTitle: true,
      title: const Text(
        MyTripsStrings.appBarTitle,
        style: MyTripsColors.appBarTitleStyle,
      ),
    );
  }

  // ---------------- Filter Bar ----------------
  Widget _buildFilterBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: MyTripsColors.filterBarBackground,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: _onFilterIconPressed,
            icon: const Icon(
              Icons.tune_rounded,
              color: MyTripsColors.filterIconColor,
            ),
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(
                    label: MyTripsStrings.filterAll,
                    filter: TripFilter.all,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    label: MyTripsStrings.filterCompleted,
                    filter: TripFilter.completed,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    label: MyTripsStrings.filterUpcoming,
                    filter: TripFilter.upcoming,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required TripFilter filter,
  }) {
    final bool isActive = _activeFilter == filter;
    return InkWell(
      onTap: () => _onFilterSelected(filter),
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? MyTripsColors.chipActiveBackground
              : MyTripsColors.chipInactiveBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: isActive
              ? MyTripsColors.chipActiveStyle
              : MyTripsColors.chipInactiveStyle,
        ),
      ),
    );
  }

  // ---------------- Trips List ----------------
  Widget _buildTripsList() {
    final trips = _filteredTrips;
    if (trips.isEmpty) {
      return Center(
        child: Text(
          MyTripsStrings.emptyStateMessage,
          style: MyTripsColors.tripLocationStyle,
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      itemCount: trips.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _TripCard(
          trip: trips[index],
          onViewDetails: () => _onViewDetailsPressed(trips[index]),
        );
      },
    );
  }

  // ---------------- Bottom Create Trip Bar ----------------
  Widget _buildCreateTripBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      color: MyTripsColors.scaffoldBackground,
      child: SizedBox(
        height: 52,
        child: OutlinedButton.icon(
          onPressed: _onCreateNewTripPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(
              color: MyTripsColors.createTripBorder,
              width: 1.4,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          icon: const Icon(
            Icons.add_circle,
            color: MyTripsColors.createTripIconColor,
            size: 20,
          ),
          label: const Text(
            MyTripsStrings.createNewTrip,
            style: MyTripsColors.createTripStyle,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PRIVATE TRIP CARD WIDGET
// ============================================================
class _TripCard extends StatelessWidget {
  final TripItem trip;
  final VoidCallback onViewDetails;

  const _TripCard({
    required this.trip,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MyTripsColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MyTripsColors.cardBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildThumbnail(),
          const SizedBox(width: 12),
          Expanded(child: _buildDetails()),
          const SizedBox(width: 8),
          _buildStatusAndAction(),
        ],
      ),
    );
  }

  Widget _buildThumbnail() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: trip.imageGradient,
      ),
      child: const Icon(
        Icons.image_outlined,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          trip.title,
          style: MyTripsColors.tripTitleStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          trip.location,
          style: MyTripsColors.tripLocationStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        Text(
          trip.date,
          style: MyTripsColors.tripDateStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildStatusAndAction() {
    final bool isCompleted = trip.status == TripStatus.completed;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildStatusChip(isCompleted),
        const SizedBox(height: 8),
        _buildViewDetailsButton(),
      ],
    );
  }

  Widget _buildStatusChip(bool isCompleted) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isCompleted
            ? MyTripsColors.statusCompletedBackground
            : MyTripsColors.statusUpcomingBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isCompleted
            ? MyTripsStrings.statusCompleted
            : MyTripsStrings.statusUpcoming,
        style: MyTripsColors.statusChipStyle.copyWith(
          color: isCompleted
              ? MyTripsColors.statusCompletedTextColor
              : MyTripsColors.statusUpcomingTextColor,
        ),
      ),
    );
  }

  Widget _buildViewDetailsButton() {
    return OutlinedButton(
      onPressed: onViewDetails,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: const BorderSide(color: MyTripsColors.viewDetailsBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: const Text(
        MyTripsStrings.viewDetails,
        style: MyTripsColors.viewDetailsStyle,
      ),
    );
  }
}

// ============================================================
// STANDALONE PREVIEW APP
// ============================================================

class MyTripsApp extends StatelessWidget {
  const MyTripsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Trips',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MyTripsScreen(),
    );
  }
}
void main() {
  runApp(const MyTripsApp());
}
