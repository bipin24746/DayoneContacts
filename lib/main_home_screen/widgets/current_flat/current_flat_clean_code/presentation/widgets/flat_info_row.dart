import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/widgets/flat_info_container.dart';
import 'package:flutter/material.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';


class FlatInfoRow extends StatelessWidget {
  final Data data;

  const FlatInfoRow({required this.data});

  @override
  Widget build(BuildContext context) {
    final block = data.floor?.block;
    return Row(
      children: [
        FlatInfoContainer(
          icon: 'lib/assets/images/red_building.png',
          label: block?.name ?? 'Unknown Block',
        ),
        const SizedBox(width: 10),
        FlatInfoContainer(
          icon: 'lib/assets/images/house.png',
          label: data.name ?? "Unknown Flat Number",
        ),
      ],
    );
  }
}
