import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------
/// THEME CONSTANTS
/// ---------------------------------------------------------------------
class _AppColors {
  static const Color activeStep = Color(0xFF004F71);
  static const Color inactiveStep = Color(0xFFC4C4C4);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF8A8A8A);
  static const Color selectedBorder = Color(0xFF1E88E5);
  static const Color selectedText = Color(0xFF1E88E5);
  static const Color unselectedBorder = Color(0xFFE3E3E3);
  static const Color sliderActive = Color(0xFF00A8CC);
  static const Color sliderInactive = Color(0xFFCDEEF5);
  static const Color primaryButton = Color(0xFF005BEA);
  static const Color pageBackground = Color(0xFFF6F7F9);
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class StartPlanningInterestsScreen extends StatefulWidget {
  const StartPlanningInterestsScreen({super.key});

  @override
  State<StartPlanningInterestsScreen> createState() =>
      _StartPlanningInterestsScreenState();
}

class _StartPlanningInterestsScreenState
    extends State<StartPlanningInterestsScreen> {
  final List<String> _interests = const [
    'Islamic Monuments',
    'Coptic',
    'Pharaonic & Ancient Sites',
    'Historical Places',
    'Greaco-Roman',
    'Museums',
    'Oases& Western Desert',
  ];

  final Set<String> _selectedInterests = {'Islamic Monuments'};

  double _budgetValue = 500;
  static const double _minBudget = 0;
  static const double _maxBudget = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AppColors.pageBackground,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressIndicator(),
              const SizedBox(height: 26),
              _buildSectionHeader(
                title: 'Select Your Interests',
                subtitle: 'Select multiple options',
              ),
              const SizedBox(height: 14),
              _buildInterestsList(),
              const SizedBox(height: 24),
              const Text(
                'Budget Range',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: _AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),
              _buildBudgetCard(),
              const SizedBox(height: 28),
              _buildNextButton(),
            ],
          ),
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
  // STEP PROGRESS BAR (2 of 3 active)
  // ---------------------------------------------------------------
  Widget _buildProgressIndicator() {
    return Row(
      children: List.generate(3, (index) {
        final bool isActive = index < 2;
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
  // SECTION HEADER
  // ---------------------------------------------------------------
  Widget _buildSectionHeader({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: _AppColors.textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13,
            color: _AppColors.textGrey,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------
  // INTERESTS LIST (multi-select)
  // ---------------------------------------------------------------
  Widget _buildInterestsList() {
    return Column(
      children: _interests.map((interest) {
        final bool isSelected = _selectedInterests.contains(interest);
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedInterests.remove(interest);
                } else {
                  _selectedInterests.add(interest);
                }
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? _AppColors.selectedBorder
                      : _AppColors.unselectedBorder,
                  width: isSelected ? 1.4 : 1,
                ),
              ),
              child: Text(
                interest,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? _AppColors.selectedText
                      : _AppColors.textDark,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ---------------------------------------------------------------
  // BUDGET RANGE CARD
  // ---------------------------------------------------------------
  Widget _buildBudgetCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How much are you planning to spend?',
            style: TextStyle(
              fontSize: 13,
              color: _AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Budget',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: _AppColors.sliderActive,
              inactiveTrackColor: _AppColors.sliderInactive,
              thumbColor: _AppColors.sliderActive,
              overlayColor: _AppColors.sliderActive.withOpacity(0.15),
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 9),
            ),
            child: Slider(
              min: _minBudget,
              max: _maxBudget,
              value: _budgetValue,
              onChanged: (value) {
                setState(() => _budgetValue = value);
              },
            ),
          ),
          Center(
            child: Text(
              '${_budgetValue.round()} EGP',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _AppColors.sliderActive,
              ),
            ),
          ),
        ],
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
          backgroundColor: _AppColors.primaryButton,
          shape: const StadiumBorder(),
          elevation: 0,
        ),
        onPressed: () {
          // TODO: Hook up navigation to the next planning step
          debugPrint(
            'Next tapped -> interests: $_selectedInterests, budget: ${_budgetValue.round()} EGP',
          );
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
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
/// ENTRY POINT (for standalone preview / testing)
/// ---------------------------------------------------------------------
class StartPlanningInterestsApp extends StatelessWidget {
  const StartPlanningInterestsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const StartPlanningInterestsScreen(),
    );
  }
}

void main() {
  runApp(const StartPlanningInterestsApp());
}