import 'package:flutter/material.dart';
import 'package:yes_no_app_devtalles/config/theme/app_theme.dart';
import 'package:yes_no_app_devtalles/presentation/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppTheme(selectedColor: 6).theme(),
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}
