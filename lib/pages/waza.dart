import 'dart:io';

import 'package:dojolink/main.dart';
import 'package:dojolink/pages/video.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class WazaPage extends StatefulWidget {
  const WazaPage({super.key});

  @override
  State<WazaPage> createState() => _WazaPageState();
}

class _WazaPageState extends State<WazaPage> {
  List<dynamic> wazaList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    checkBuckets();
    fetchWaza();
  }

  Future<void> checkBuckets() async {
    final buckets = await supabase.storage.listBuckets();
    print('Buckets found: ${buckets.map((b) => b.name).toList()}');
  }

  Future<void> uploadWaza(
    String name,
    String description,
    XFile? image,
    XFile video,
  ) async {
    setState(() => isLoading = true);

    final userId = supabase.auth.currentUser?.id ?? 'anonymous';
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    String? imagePath;
    String? videoPath;

    if (image != null) {
      imagePath = '$userId/thumbnails/$timestamp-${image.name}';
      await supabase.storage
          .from('thumbnails')
          .upload(imagePath, File(image.path));
    }

    videoPath = '$userId/videos/$timestamp-${video.name}';
    await supabase.storage.from('videos').upload(videoPath, File(video.path));

    await supabase.from('waza').insert({
      'name': name,
      'description': description,
      'image_path': imagePath,
      'video_path': videoPath,
    });

    await fetchWaza();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Waza is toegevoegd aan bibliotheek')),
      );
    }
    setState(() => isLoading = false);
  }

  Future<void> fetchWaza() async {
    setState(() => isLoading = true);

    final response = await supabase.from('waza').select().order('created_at');

    setState(() {
      wazaList = response;
      isLoading = false;
    });
  }

  Future<void> addWaza(String name, String description) async {
    await supabase.from('waza').insert({
      'name': name,
      'description': description,
    });
    fetchWaza(); // refresh list
  }

  void showAddWazaDialog() {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    XFile? imageFile;
    XFile? videoFile;
    final picker = ImagePicker();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add New Waza'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: descController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            final picked = await picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (picked != null) {
                              setState(() => imageFile = picked);
                            }
                          },
                          icon: const Icon(Icons.image),
                          label: const Text("Select Image"),
                        ),
                        const SizedBox(width: 8),
                        if (imageFile != null)
                          const Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            final picked = await picker.pickVideo(
                              source: ImageSource.gallery,
                            );
                            if (picked != null) {
                              setState(() => videoFile = picked);
                            }
                          },
                          icon: const Icon(Icons.videocam),
                          label: const Text("Select Video"),
                        ),
                        const SizedBox(width: 8),
                        if (videoFile != null)
                          const Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty || videoFile == null)
                      return;

                    Navigator.pop(context);
                    await uploadWaza(
                      nameController.text,
                      descController.text,
                      imageFile,
                      videoFile!,
                    );
                  },
                  child: const Text('Upload'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Waza')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: wazaList.length,
              itemBuilder: (context, index) {
                final waza = wazaList[index];
                return ListTile(
                  leading:
                      (waza['image_path'] != null && waza['image_path'] != '')
                      ? Image.network(
                          supabase.storage
                              .from('thumbnails')
                              .getPublicUrl(waza['image_path']!),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.image_not_supported),

                  title: Text(waza['name'] ?? ''),
                  subtitle: Text(waza['description'] ?? ''),
                  onTap: () {
                    final videoPath = waza['video_path'];
                    if (videoPath != null && videoPath.isNotEmpty) {
                      final videoUrl = supabase.storage
                          .from('videos')
                          .getPublicUrl(videoPath);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VideoPage(videoUrl: videoUrl),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No video available')),
                      );
                    }
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddWazaDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
