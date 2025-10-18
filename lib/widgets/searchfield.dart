import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(20),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 15,
              height: 15,
            ),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.grey,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.3,
                    width: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          hintText: 'Dojo zoeken..',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
