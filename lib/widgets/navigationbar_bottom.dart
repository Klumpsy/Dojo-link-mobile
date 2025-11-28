import 'package:flutter/material.dart';
import 'package:dojolink/pages/waza.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WazaPage()),
          );
        }
        onTap(index);
      },
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: _NavIcon(icon: Icons.home, index: 0),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon(icon: Icons.sports_martial_arts, index: 1),
          label: 'Waza',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon(icon: Icons.more_horiz, index: 2),
          label: 'More',
        ),
      ],
    );
  }
}

/// Custom icon with active indicator
class _NavIcon extends StatelessWidget {
  final IconData icon;
  final int index;

  const _NavIcon({required this.icon, required this.index});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar navigationBar = context
        .findAncestorWidgetOfExactType<BottomNavigationBar>()!;
    final bool isSelected = navigationBar.currentIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected ? Colors.white : Colors.white70),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(top: 4),
          height: 4,
          width: isSelected ? 16 : 0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
