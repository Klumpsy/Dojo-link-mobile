import 'package:dojolink/models/waza_model.dart';
import 'package:flutter/material.dart';

class WazaCard extends StatelessWidget {
  const WazaCard({super.key, required this.waza});

  final WazaModel waza;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 235, 150, 140),
            const Color.fromARGB(255, 141, 9, 0).withValues(alpha: 0.3),
          ],
        ),

        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              waza.imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              waza.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 2, // prevents overflow
              overflow: TextOverflow.ellipsis, // adds ... if too long
            ),
          ),
          Spacer(),
          Container(
            width: 210,
            height: 35,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 81, 81),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(255, 182, 165, 248),
                  const Color.fromARGB(255, 136, 173, 242),
                ],
              ),
            ),
            child: Center(
              child: Text(
                'Bekijk',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
