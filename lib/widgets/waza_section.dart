import 'package:flutter/material.dart';
import 'package:dojolink/models/waza_model.dart';
import 'package:dojolink/widgets/waza_card.dart';
import 'package:dojolink/main.dart'; // for supabase

class WazaSection extends StatefulWidget {
  const WazaSection({super.key});

  @override
  State<WazaSection> createState() => _WazaSectionState();
}

class _WazaSectionState extends State<WazaSection> {
  List<WazaModel> wazaList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWaza();
  }

  Future<void> fetchWaza() async {
    setState(() => isLoading = true);

    final response = await supabase.from('waza').select().order('created_at');

    setState(() {
      wazaList = (response as List).map((e) => WazaModel.fromMap(e)).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (wazaList.isEmpty) {
      return const Center(child: Text('No Waza found'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Waza',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 260,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: wazaList.length,
            itemBuilder: (context, index) {
              return WazaCard(waza: wazaList[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 25),
          ),
        ),
      ],
    );
  }
}
