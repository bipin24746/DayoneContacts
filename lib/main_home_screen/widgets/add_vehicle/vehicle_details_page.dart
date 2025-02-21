import 'dart:io';
import 'package:flutter/material.dart';

class VehicleDetailsPage extends StatelessWidget {
  final String vehicleType;
  final String vehicleName;
  final String vehicleNumber;
  final File? vehicleImage;

  const VehicleDetailsPage({
    super.key,
    required this.vehicleType,
    required this.vehicleName,
    required this.vehicleNumber,
    this.vehicleImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vehicle Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: vehicleImage != null
                  ? ClipOval(
                child: Image.file(
                  vehicleImage!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )
                  : const Icon(Icons.directions_car, size: 100),
            ),
            const SizedBox(height: 20),
            Text(
              "Vehicle Type: $vehicleType",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Vehicle Name: $vehicleName",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Vehicle Number: $vehicleNumber",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
