import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/bloc/current_flat_bloc.dart';

class CurrentFlatClean extends StatelessWidget {
  const CurrentFlatClean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentFlatBloc, CurrentFlatState>(
      builder: (context, state) {
        if (state is CurrentFlatLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CurrentFlatLoaded) {
          debugPrint("Flat: ${state.currentFlatIntegration.data.length}");
          return _buildCurrentFlat(state.currentFlatIntegration);
        } else if (state is CurrentFlatError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No flats available'));
        }
      },
    );
  }

  Widget _buildCurrentFlat(CurrentFlatIntegration currentFlatIntegration) {
    if (currentFlatIntegration.data == null || currentFlatIntegration.data.isEmpty) {
      debugPrint("No flats found!");
      return const Center(child: Text('No flats available'));
    }

    // if (currentFlatIntegration.data == null || currentFlatIntegration.data.isEmpty) {
    //   debugPrint("No flats found!");
    //   return const Center(child: Text('No flats available'));
    // }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
            Text(
              "Your apartment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(
              thickness: 2,
              color: Colors.blueGrey.withOpacity(0.3),
            ),
            // ListView.builder will be used to display all the flat items
            ListView.builder(
              shrinkWrap: true,  // To prevent ListView from taking all available space
              itemCount: currentFlatIntegration.data.length,
              itemBuilder: (context, index) {
                final flat = currentFlatIntegration.data[index];
                return Container(
                  height: 90,
                  width: double.infinity,
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
                          flat.name ?? 'Unknown Apartment',  // Ensure null safety
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              flat.floor ?? 'Unknown floor',  // Display floor if available
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      // Image.asset('lib/assets/images/red_building.png', width: 40),
                      // Text(
                      //   currentFlatIntegration?.data?.first?.floor?.block?.name
                      //
                      //       ?? 'Unknown Block',
                      // ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Image.asset('lib/assets/images/house.png', width: 40),
                      Text(currentFlatIntegration.data.first.name ?? "Unknown Flat Number"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
