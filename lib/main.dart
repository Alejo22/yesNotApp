import 'package:flutter/material.dart';
import 'package:maybe_app/presentation/providers/chat_provider.dart';
import 'package:maybe_app/presentation/screens/chat_screen.dart';
import 'package:maybe_app/presentation/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //el guión bajo (_) especifica que no interesa ese argumento de context
      providers: [ ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Yes or Not app',
        theme:  AppTheme( 
          selectedColor: 4
        ).theme(),
        home: const ChatScreen()
      )
    );
  }
}