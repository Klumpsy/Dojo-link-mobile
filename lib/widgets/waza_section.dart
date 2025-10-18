import 'package:dojolink/models/waza_model.dart';
import 'package:flutter/material.dart';
import 'package:dojolink/widgets/waza_card.dart';

Column wazaSection() {
  List<WazaModel> waza = WazaModel.getWaza();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'Waza',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 20),
      SizedBox(
        height: 260,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 20, right: 20),
          scrollDirection: Axis.horizontal,
          itemCount: waza.length,
          itemBuilder: (context, index) {
            return WazaCard(waza: waza[index]);
          },
          separatorBuilder: (context, index) => SizedBox(width: 25),
        ),
      ),
    ],
  );
}
