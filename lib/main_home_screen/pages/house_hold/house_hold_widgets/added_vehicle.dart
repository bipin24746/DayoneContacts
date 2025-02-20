import 'package:dayonecontacts/main_home_screen/pages/house_hold/house_hold_service/house_hold_model.dart';
import 'package:dayonecontacts/main_home_screen/pages/house_hold/house_hold_service/vehicle_added_api.dart';
import 'package:flutter/material.dart';

class HouseHoldAddedVehicle extends StatelessWidget {
  final Data vehicle; // Accept the vehicle data

  const HouseHoldAddedVehicle({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CircleAvatar(
                radius: 20,
                child: Icon(Icons.car_repair),
              ),
            ),
            Text(
              vehicle.name ?? "Unknown", // Display the vehicle name
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5),
                child: Text(
                  vehicle.type ?? "Unknown", // Display the vehicle type
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

