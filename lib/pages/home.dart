import 'package:dojolink/widgets/appbar_top.dart';
import 'package:dojolink/widgets/navigationbar_bottom.dart';
import 'package:dojolink/widgets/searchfield.dart';
import 'package:flutter/material.dart';
import 'package:dojolink/widgets/waza_section.dart';
import 'package:dojolink/widgets/category_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // To handle selected button (optional visual feedback)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SearchField(),
          const SizedBox(height: 20),
          categoriesSection(),
          const SizedBox(height: 20),
          wazaSection(),
          const SizedBox(height: 20),
        ],
      ),

      // 👇 Bottom App Bar with three buttons
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
