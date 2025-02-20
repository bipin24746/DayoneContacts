import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_refractored/vehicle_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'vehicle_image_picker.dart';
import 'vehicle_type_dropdown.dart';

@RoutePage()
class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}
class _AddVehicleState extends State<AddVehicle> {
  final TextEditingController vehicleNameController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  String? _selectedValue;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Vehicle", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VehicleImagePicker(
              image: _image,
              onImagePicked: (pickedImage) {
                setState(() {
                  _image = pickedImage;
                });
              },
            ),
            const SizedBox(height: 20),
            VehicleTypeDropdown(
              selectedValue: _selectedValue,
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: vehicleNameController,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Name*"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: vehicleNumberController,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Vehicle Number*"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
            onPressed: () async {
              final isValid = vehicleNameController.text.isNotEmpty && vehicleNumberController.text.isNotEmpty && _selectedValue != null;
              if (!isValid) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields")));
                return;
              }

              // Create the vehicle and pass data back to the previous screen
              await VehicleService.addVehicle(
                vehicleName: vehicleNameController.text,
                vehicleNumber: vehicleNumberController.text,
                vehicleType: _selectedValue!,
                image: _image,
                context: context,
              );

              // Create a map or model of vehicle data to pass back
              Map<String, String> newVehicle = {
                'name': vehicleNameController.text,
                'type': _selectedValue!,
                'vehicleNumber': vehicleNumberController.text,
              };

              // Pop the current screen and pass the new vehicle data
              Navigator.pop(context, newVehicle);
            },
            child: const Text(
              "Create",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

