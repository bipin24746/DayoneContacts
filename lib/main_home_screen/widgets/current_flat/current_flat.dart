import 'package:dayonecontacts/main_home_screen/widgets/current_flat/api_data/api_data_current_flat.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/api_data/api_services_current_flat.dart';
import 'package:flutter/material.dart';

class CurrentFlatUI extends StatefulWidget {
  const CurrentFlatUI({super.key});

  @override
  State<CurrentFlatUI> createState() => _CurrentFlatState();
}

class _CurrentFlatState extends State<CurrentFlatUI> {
  CurrentFlat? CurrentFlatApi; // Corrected type here to CurrentFlat?
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getDataFlat();
  }

  getDataFlat() async {
    // Fetch the data from the API
    CurrentFlatApi = await CurrentFlatApiServices().getDataFlat();
    if (CurrentFlatApi != null) {
      setState(() {
        isLoaded = true; // Mark data as loaded
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
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
                      height: 90, // Adjust height if needed
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
                            // Safely access the data using null check
                            Text(
                              CurrentFlatApi
                                      ?.data?.floor?.block?.apartment?.name ??
                                  'Unknown Apartment',
                              // "Sarook International angel invest \n apartment",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  CurrentFlatApi?.data?.floor?.block?.apartment
                                          ?.area ??
                                      'Unknown area',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  CurrentFlatApi?.data?.floor?.block?.apartment
                                          ?.city ??
                                      'Unknown city',
                                  // "Kathmandu",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0, // Position image at the bottom
                      right: 10, // Position image to the right side
                      child: Image.asset(
                        'lib/assets/images/flat_buildings.png',
                        width: 50, // You can adjust this width if needed
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
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
                          Image.asset('lib/assets/images/red_building.png', width: 40,),
                          Text(
                            CurrentFlatApi?.data?.floor?.block?.name ??
                                'Unknown Block',
                              // "Block A"
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Image.asset('lib/assets/images/house.png',width: 40,),
                          Text(CurrentFlatApi?.data?.name ?? "unknown Flat Number",

                              // "A-101"
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
