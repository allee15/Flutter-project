import 'package:flutter/material.dart';

class ContactUsViewModel extends ChangeNotifier {
  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    print('Message sent: ${messageController.text}');
    messageController.clear();
  }
}
