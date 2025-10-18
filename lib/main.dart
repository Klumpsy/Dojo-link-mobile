import 'package:dojolink/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ktjtelrzdqlxmndywsyn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt0anRlbHJ6ZHFseG1uZHl3c3luIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA3NDg0MTQsImV4cCI6MjA3NjMyNDQxNH0.Gl9dFmDJdU3griv0HcB_R8QZkOTOAcEIhTbG0dGrMMM',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dojolink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'FiraSans'),
      home: HomePage(),
    );
  }
}
