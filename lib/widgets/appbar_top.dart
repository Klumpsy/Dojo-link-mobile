import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar appBar() {
  return AppBar(
    title: Text(
      'Dojo link',
      style: TextStyle(
        color: const Color.fromARGB(255, 255, 81, 81),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        // Handle back button tap
      },
      child: Container(
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 237, 98, 98),
        ),
        child: SvgPicture.asset(
          'assets/icons/back.svg',
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          // Handle search icon tap
        },
        child: Container(
          margin: EdgeInsets.all(8),
          width: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 237, 98, 98),
          ),
          child: SvgPicture.asset(
            'assets/icons/dots.svg',
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    ],
  );
}
