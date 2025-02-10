import 'dart:developer';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/api_data/api_data_current_flat.dart'; // Make sure you're importing the correct model
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/api_data/api_services_current_flat.dart';
import 'package:flutter/material.dart';

class CurrentFlatWidget extends StatefulWidget {
  const CurrentFlatWidget({super.key});

  @override
  State<CurrentFlatWidget> createState() => _CurrentFlatWidgetState();
}

class _CurrentFlatWidgetState extends State<CurrentFlatWidget> {
  late Future<CurrentFlat?> currentFlatData;

  @override
  void initState() {
    super.initState();
    currentFlatData = CurrentFlatApiServices().getData();  // Initialize the data fetching
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CurrentFlat?>(
        future: currentFlatData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            CurrentFlat? currentFlatData = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
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
                        Stack(
                          children: [
                            Container(
                              height: 90,
                              width: MediaQuery.of(context).size.width,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(currentFlatData?.data?.name ?? 'Unknown apartment'),
                                      Text(currentFlatData?.data?.floor?.name ?? 'Unknown floor'),
                                      Text(currentFlatData?.data?.floor?.block?.name ?? 'Unknown block'),
                                      Text(currentFlatData?.data?.floor?.block?.apartment?.name ?? 'Unknown apartment name'),
                                      Text(
                                        currentFlatData?.data?.floor?.block?.apartment?.city ?? 'Unknown city',
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 10,
                              child: Image.asset(
                                'lib/assets/images/flat_buildings.png',
                                width: 70,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/red_building.png',
                                    width: 25,
                                  ),
                                  Text("Block A")
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/house.png',
                                    width: 30,
                                  ),
                                  Text("A-101")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
