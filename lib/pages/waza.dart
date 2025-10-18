import 'package:dojolink/widgets/navigationbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

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
    fetchWaza();
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

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Waza'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                addWaza(nameController.text, descController.text);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
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
                  title: Text(waza['name']),
                  subtitle: Text(waza['description'] ?? ''),
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
