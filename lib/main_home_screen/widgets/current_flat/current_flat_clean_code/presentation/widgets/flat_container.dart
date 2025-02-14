import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/widgets/flat_details.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/widgets/flat_info_row.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';


class FlatContainer extends StatelessWidget {
  final CurrentFlatIntegration currentFlatIntegration;

  const FlatContainer({required this.currentFlatIntegration});

  @override
  Widget build(BuildContext context) {
    final data = currentFlatIntegration.data;

    if (data == null) {
      debugPrint("No flat found!");
      return const Center(child: Text('No flat available'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white30,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget(),  // Displays the title "Your apartment"
              const Divider(thickness: 2, color: Colors.blueGrey, height: 10),
              FlatDetails(data: data),  // Displays detailed information about the flat
              const SizedBox(height: 10),
              FlatInfoRow(data: data),  // Displays additional flat info in a row
            ],
          ),
        ),
      ),
    );
  }
}
