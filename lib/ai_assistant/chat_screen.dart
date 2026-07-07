import 'package:flutter/material.dart';
import 'package:rahhal_app/home/home_screen.dart';

import '../api/ai_chat_api/chat_with_ai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  @override
  Widget build(BuildContext context) {
    // الألوان المستخدمة في الصورة
    const primaryColor = Color(0xFF0056B3); // اللون الأزرق العلوي وللأزرار
    const backgroundColor = Color(0xFFF8F9FA); // خلفية المحادثة البيضاء المائلة للرمادي

    // اقتراحات الأسئلة الموجودة في الصورة
    final suggestions = [
      "Plan a 1-day trip in Luxor with 300 EGP",
      "Best historical Places in Cairo",
      "Family-friendly activities",
      "Budget-friendly restaurants",
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      // 1. الجزء العلوي (AppBar)
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (_)=>HomeScreen()));
          },
        ),
        title: Row(
          children: [
            // أيقونة المساعد الذكي الدائرية
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white.withOpacity(0.2),
              child: const Icon(Icons.smart_toy_outlined, color: Colors.white),
            ),
            const SizedBox(width: 12),
            // اسم المساعد وحالته
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'AI Assistant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // 2. جسم المحادثة (الرسائل والاقتراحات)
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return Align(
                  alignment: message["isUser"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: message["isUser"]
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      message["text"],
                      style: TextStyle(
                        color: message["isUser"]
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 3. شريط إدخال النص السفلي (Bottom Input Bar)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // حقل الكتابة
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F3F5),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child:  TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: "Ask me anything...",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // زر الإرسال الأزرق الدائري
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: primaryColor,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white, size: 20),
                      onPressed: sendMessage
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> sendMessage() async {
    if (messageController.text.trim().isEmpty) return;

    String userMessage = messageController.text;

    setState(() {
      messages.add({
        "isUser": true,
        "text": userMessage,
      });
    });

    messageController.clear();

    try {
      String aiReply = await sendMessageToAI(userMessage);

      setState(() {
        messages.add({
          "isUser": false,
          "text": aiReply,
        });
      });
    } catch (e) {
      setState(() {
        messages.add({
          "isUser": false,
          "text": "Something went wrong.",
        });
      });

      print(e);
    }
  }
}