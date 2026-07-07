import 'package:flutter/material.dart';
import 'package:rahhal_app/place_details/start_planning_2_screen.dart';

/// ---------------------------------------------------------------------
/// THEME CONSTANTS
/// ---------------------------------------------------------------------
class _AppColors {
  static const Color darkBlue = Color(0xFF0B3D91);
  static const Color primaryBlue = Color(0xFF1565D8);
  static const Color activeStep = Color(0xFF0B3D91);
  static const Color inactiveStep = Color(0xFFD8DCE3);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF757575);
  static const Color cardBorder = Color(0xFFEDEDED);
  static const Color optionBorder = Color(0xFFE0E0E0);
  static const Color pageBackground = Color(0xFFF6F9FC);
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class StartPlanningScreen extends StatefulWidget {
  const StartPlanningScreen({super.key});

  @override
  State<StartPlanningScreen> createState() => _StartPlanningScreenState();
}

class _StartPlanningScreenState extends State<StartPlanningScreen> {
  String? _selectedCity;
  String? _selectedBudget;
  String? _selectedTravelers;

  final List<String> _cities = const [
    'Cairo',
    'Giza',
    'Luxor',
    'Aswan',
    'Alexandria',
    'Sharm El Sheikh',
  ];

  final List<String> _budgetOptions = const ['1 Day', '2-3 Days', '4+ Days'];

  final List<String> _travelersOptions = const [
    '1 Person',
    '2 People',
    '3-4 People',
    '5+ People',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/start_planning_illustration.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressIndicator(),
                  const SizedBox(height: 28),
                  _buildHeaderText(),
                  const SizedBox(height: 24),
                  _buildDestinationCard(),
                  const SizedBox(height: 16),
                  _buildTravelersCountCard(),
                  const SizedBox(height: 16),
                  _buildBudgetRangeCard(),
                  const SizedBox(height: 28),
                  _buildNextButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // APP BAR
  // ---------------------------------------------------------------
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
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
  // PROGRESS INDICATOR (3 discrete steps)
  // ---------------------------------------------------------------
  Widget _buildProgressIndicator() {
    return Row(
      children: List.generate(3, (index) {
        final bool isActive = index == 0;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: index != 2 ? 8 : 0),
            height: 4,
            decoration: BoxDecoration(
              color: isActive ? _AppColors.activeStep : _AppColors.inactiveStep,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }

  // ---------------------------------------------------------------
  // HEADER TEXT
  // ---------------------------------------------------------------
  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Let's Build Your Trip",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: _AppColors.textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Plan your perfect Egyptian adventure',
          style: TextStyle(
            fontSize: 13.5,
            color: _AppColors.textGrey,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------
  // ILLUSTRATION (local asset, no network/placeholder)
  // ---------------------------------------------------------------
  Widget _buildIllustration(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height * 0.22;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Image.asset(
          'assets/images/start_planning_illustration.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // DESTINATION CARD
  // ---------------------------------------------------------------
  Widget _buildDestinationCard() {
    return _SectionCard(
      title: 'Destination',
      subtitle: 'Where so you want to explore?',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F5F8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _AppColors.optionBorder),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedCity,
            isExpanded: true,
            hint: Text(
              'Select City',
              style: TextStyle(
                fontSize: 14,
                color: _AppColors.textGrey,
              ),
            ),
            icon: const Icon(Icons.keyboard_arrow_down_rounded,
                color: _AppColors.textGrey),
            items: _cities
                .map(
                  (city) => DropdownMenuItem<String>(
                value: city,
                child: Text(
                  city,
                  style: const TextStyle(
                    fontSize: 14,
                    color: _AppColors.textDark,
                  ),
                ),
              ),
            )
                .toList(),
            onChanged: (value) {
              setState(() => _selectedCity = value);
            },
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // TRAVELERS COUNT CARD (new required section)
  // ---------------------------------------------------------------
  Widget _buildTravelersCountCard() {
    return _SectionCard(
      title: 'Travelers Count',
      subtitle: 'How many people are traveling?',
      child: _OptionsWrap(
        options: _travelersOptions,
        selected: _selectedTravelers,
        onSelected: (value) {
          setState(() => _selectedTravelers = value);
        },
      ),
    );
  }

  // ---------------------------------------------------------------
  // BUDGET RANGE CARD
  // ---------------------------------------------------------------
  Widget _buildBudgetRangeCard() {
    return _SectionCard(
      title: 'Budget Range',
      subtitle: 'How much are you planning to spend?',
      child: _OptionsWrap(
        options: _budgetOptions,
        selected: _selectedBudget,
        onSelected: (value) {
          setState(() => _selectedBudget = value);
        },
      ),
    );
  }

  // ---------------------------------------------------------------
  // NEXT BUTTON
  // ---------------------------------------------------------------
  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
          onPressed: () {
            if (_selectedCity == null ||
                _selectedBudget == null ||
                _selectedTravelers == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please complete all fields"),
                ),
              );
              return;
            }

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    StartPlanningInterestsScreen(
                      city: _selectedCity!,
                      duration: _selectedBudget!,
                      travelers: _selectedTravelers!,
                    ),
              )
            );

          debugPrint(
            'Next tapped -> city: $_selectedCity, travelers: $_selectedTravelers, budget: $_selectedBudget',
          );
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------
/// REUSABLE WHITE CARD SECTION
/// ---------------------------------------------------------------------
class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              color: _AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------
/// REUSABLE OPTION CHIP ROW (used by Budget Range & Travelers Count)
/// ---------------------------------------------------------------------
class _OptionsWrap extends StatelessWidget {
  final List<String> options;
  final String? selected;
  final ValueChanged<String> onSelected;

  const _OptionsWrap({
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((option) {
        final bool isSelected = selected == option;
        return GestureDetector(
          onTap: () => onSelected(option),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? _AppColors.primaryBlue.withOpacity(0.08)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? _AppColors.primaryBlue
                    : _AppColors.optionBorder,
                width: isSelected ? 1.4 : 1,
              ),
            ),
            child: Text(
              option,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? _AppColors.primaryBlue
                    : _AppColors.textDark,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

