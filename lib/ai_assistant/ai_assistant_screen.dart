import 'package:flutter/material.dart';
import 'package:rahhal_app/api/places_api.dart';

/// ---------------------------------------------------------------------
/// DATA MODEL
/// ---------------------------------------------------------------------
class ChatMessageModel {
  final String text;
  final String time;
  final bool isFromUser;

  const ChatMessageModel({
    required this.text,
    required this.time,
    this.isFromUser = false,
  });
}

/// ---------------------------------------------------------------------
/// THEME CONSTANTS
/// ---------------------------------------------------------------------
class _AppColors {
  static const Color primaryBlue = Color(0xFF005BEA);
  static const Color avatarBg = Color(0xFF5B9BF5);
  static const Color pageBackground = Color(0xFFF6F7F9);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF8A8A8A);
  static const Color chipBorder = Color(0xFFE7E7E7);
  static const Color inputBackground = Color(0xFFF0F1F4);
}

/// ---------------------------------------------------------------------
/// SCREEN
/// ---------------------------------------------------------------------
class AIAssistantChatScreen extends StatefulWidget {
  const AIAssistantChatScreen({super.key});

  @override
  State<AIAssistantChatScreen> createState() => _AIAssistantChatScreenState();
}

class _AIAssistantChatScreenState extends State<AIAssistantChatScreen> {
  final TextEditingController _inputController = TextEditingController();

  final List<ChatMessageModel> _messages = [
    const ChatMessageModel(
      text:
      "Hello! I'm your AI travel assistant. How Can I help you plan your Egyptian adventure today?",
      time: '06:31 PM',
      isFromUser: false,
    ),
  ];

  final List<String> _suggestions = const [
    'Plan a 1-day trip in Luxor with 300 EGP',
    'Best historical Places in Cairo',
    'Family-friendly activities',
    'Budget-friendly restaurants',
  ];

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _handleSend([String? presetText]) async {
    final String text = (presetText ?? _inputController.text).trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(
        ChatMessageModel(
          text: text,
          time: _currentTime(),
          isFromUser: true,
        ),
      );
      _inputController.clear();
    });
    try {
      String? aiReply = await PlacesApi.sendAssistantMessage(message: text);
      if (aiReply != null) {
        setState(() {
          _messages.add(
            ChatMessageModel(
              text: aiReply,
              time: _currentTime(),
              isFromUser: false,
            ),
          );
        });
      } else {
        setState(() {
          _messages.add(
            ChatMessageModel(
              text: "عذراً، حدث خطأ في الحصول على رد من المساعد.",
              time: _currentTime(),
              isFromUser: false,
            ),
          );
        });
      }
    } catch (e) {
      debugPrint('Error sending message: $e');
    }
  }

 /* void _handleSend([String? presetText]) {
    final String text = (presetText ?? _inputController.text).trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessageModel(
          text: text,
          time: _currentTime(),
          isFromUser: true,
        ),
      );
      _inputController.clear();
    });

    // TODO: Hook up actual AI assistant response logic here.
    debugPrint('User asked: $text');
  } */

  String _currentTime() {
    final now = TimeOfDay.now();
    final hour = now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AppColors.pageBackground,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._messages.map(_buildMessageBubble),
                  const SizedBox(height: 24),
                  _buildTryAskingSection(),
                ],
              ),
            ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------
  // HEADER
  // ---------------------------------------------------------------
  Widget _buildHeader(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(12, 10, 20, 18),
        color: _AppColors.primaryBlue,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.maybePop(context),
            ),
            const SizedBox(width: 4),
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: _AppColors.avatarBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.smart_toy_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Assistant',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // MESSAGE BUBBLE
  // ---------------------------------------------------------------
  Widget _buildMessageBubble(ChatMessageModel message) {
    final bool isUser = message.isFromUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        decoration: BoxDecoration(
          color: isUser ? _AppColors.primaryBlue : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.text,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: isUser ? Colors.white : _AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 11,
                color: isUser ? Colors.white70 : _AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // TRY ASKING SUGGESTIONS
  // ---------------------------------------------------------------
  Widget _buildTryAskingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Try asking:',
          style: TextStyle(
            fontSize: 13,
            color: _AppColors.textGrey,
          ),
        ),
        const SizedBox(height: 10),
        ..._suggestions.map(
              (suggestion) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _buildSuggestionChip(suggestion),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionChip(String text) {
    return GestureDetector(
      onTap: () => _handleSend(text),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: _AppColors.chipBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13.5,
            color: _AppColors.textGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------
  // BOTTOM INPUT BAR
  // ---------------------------------------------------------------
  Widget _buildInputBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: _AppColors.inputBackground,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _inputController,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _handleSend(),
                decoration: const InputDecoration(
                  hintText: 'Ask me anything...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: _AppColors.textGrey,
                  ),
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: _AppColors.textDark,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => _handleSend(),
            child: Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                color: _AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 20,
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
class AIAssistantChatApp extends StatelessWidget {
  const AIAssistantChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const AIAssistantChatScreen(),
    );
  }
}

void main() {
  runApp(const AIAssistantChatApp());
}