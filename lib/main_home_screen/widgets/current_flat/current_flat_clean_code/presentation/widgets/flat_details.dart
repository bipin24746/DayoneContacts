import 'package:flutter/material.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';

class FlatDetails extends StatelessWidget {
  final Data data;

  const FlatDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    final apartment = data.floor?.block?.apartment;

    return Stack(
      children: [
        Container(
          height: 90,
          // width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  apartment?.name ?? 'Unknown Apartment',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      apartment?.area ?? 'Unknown area',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      apartment?.city ?? 'Unknown city',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Image.asset(
            'lib/assets/images/flat_buildings.png',
            width: 50,
          ),
        ),
      ],
    );
  }
}
