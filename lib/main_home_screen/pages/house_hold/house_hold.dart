import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class HouseHoldScreen extends StatefulWidget {
  // final String vehicleType;
  // final String vehicleName;
  // final String vehicleNumber;
  // final File? vehicleImage;

  const HouseHoldScreen({
    super.key,
    // required this.vehicleType,
    // required this.vehicleName,
    // required this.vehicleNumber,
    // this.vehicleImage,
  });

  @override
  State<HouseHoldScreen> createState() => _HouseHoldScreenState();
}

class _HouseHoldScreenState extends State<HouseHoldScreen> {
  bool isLoading = true;
  List<dynamic> vehiclesList = [];

  @override
  void initState() {
    super.initState();
    fetchVehicles();
  }

  Future<void> fetchVehicles() async {
    try {
      Dio dio = Dio();
      final url = 'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle';

      final prefs = await SharedPreferences.getInstance();
      final authToken = prefs.getString('authToken');

      if (authToken == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Authorization token is missing.")));
        return;
      }

      dio.options.headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      };

      final response = await dio.get(url);

      if (response.statusCode == 200 && response.data['success'] == true) {
        log("response ${response.data['data']}");
        setState(() {
          vehiclesList = response.data['data'] ?? [];
          isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response.data['message'] ?? 'Failed to load data')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to fetch vehicles")));
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Household",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                  child: Icon(
                    Icons.car_repair,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Vehicles",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black45),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Add Vehicle Button
            GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(AddVehiclesRoute());
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue,
                        Colors.lightBlueAccent,
                        Colors.white,
                      ]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, color: Colors.white, size: 30),
                    SizedBox(height: 5),
                    Text(
                      "Add Vehicle",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Display Vehicles List
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : vehiclesList.isEmpty
                  ? const Center(child: Text("No vehicles available"))
                  : ListView.builder(
                itemCount: vehiclesList.length,
                itemBuilder: (context, index) {
                  final vehicle = vehiclesList[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        // backgroundImage: Image.network(vehicle.) // If no image, backgroundImage is null
                        // Show nothing if image exists
                      ),

                      title: Text(
                        vehicle['name'] ?? "Unknown Vehicle",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            vehicle['type'] ?? "Unknown Type",
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
