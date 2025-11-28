import 'package:dojolink/main.dart';
import 'package:dojolink/models/waza_model.dart';
import 'package:dojolink/pages/video.dart';
import 'package:flutter/material.dart';

class WazaCard extends StatelessWidget {
  const WazaCard({super.key, required this.waza});

  final WazaModel waza;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final videoPath = waza.videoPath;
        if (videoPath != null && videoPath.isNotEmpty) {
          final videoUrl = supabase.storage
              .from('videos')
              .getPublicUrl(videoPath);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => VideoPage(videoUrl: videoUrl)),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('No video available')));
        }
      },
      child: Container(
        width: 210,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 235, 150, 140),
              const Color.fromARGB(255, 141, 9, 0).withOpacity(0.3),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: waza.imagePath != null && waza.imagePath!.isNotEmpty
                  ? Image.network(
                      supabase.storage
                          .from('thumbnails')
                          .getPublicUrl(waza.imagePath!),
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: double.infinity,
                      height: 150,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                waza.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Container(
              width: 210,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
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
              child: const Center(
                child: Text(
                  'Bekijk',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
