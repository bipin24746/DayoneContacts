import 'dart:io';
import 'package:flutter/material.dart';

class HouseHoldAddedVehicle extends StatelessWidget {
  final String vehicleType;
  final String vehicleName;
  final String vehicleNumber;
  final File? vehicleImage;

  const HouseHoldAddedVehicle({
    super.key,
    required this.vehicleType,
    required this.vehicleName,
    required this.vehicleNumber,
    this.vehicleImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Added Vehicle")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: vehicleImage != null ? FileImage(vehicleImage!) : null,
                child: vehicleImage == null
                    ? const Icon(Icons.directions_car, size: 40)
                    : null,
              ),
              const SizedBox(height: 10),
              Text(
                vehicleName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text("Number: $vehicleNumber"),
              const SizedBox(height: 5),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    vehicleType,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
