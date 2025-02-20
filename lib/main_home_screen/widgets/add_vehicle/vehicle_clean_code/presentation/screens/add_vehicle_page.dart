// lib/presentation/pages/add_vehicle_page.dart
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/data/models/add_vehicle_response_model.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/presentation/bloc/add_vehicle_bloc.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/presentation/bloc/add_vehicle_event.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_clean_code/presentation/bloc/add_vehicle_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class AddVehiclePage extends StatefulWidget {
  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final List<String> vehicles = ["two_wheeler", "four_wheeler"];
  String? _selectedValue;
  File? _image;

  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Vehicle',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upload photo
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Open the image picker dialog
                      _showImagePickerDialog();
                    },
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          _image != null
                              ? ClipOval(
                            child: Image.file(
                              _image!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          )
                              : const Icon(Icons.car_repair),
                          _image == null
                              ? Positioned(
                            bottom: 0,
                            right: 5,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.orange, width: 1),
                              ),
                              child: const Icon(
                                Icons.image,
                                color: Colors.orange,
                                size: 15,
                              ),
                            ),
                          )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Upload Photo",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Vehicle type dropdown
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: DropdownButton<String>(
                  value: _selectedValue,
                  hint: const Text(
                    "Vehicle Type",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  isExpanded: true,
                  items: ['two_wheeler', 'four_wheeler']
                      .map<DropdownMenuItem<String>>((String vehicle) {
                    return DropdownMenuItem<String>(
                      value: vehicle,
                      child: Text(vehicle),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),

            // Vehicle name field
            TextFormField(
              controller: vehicleNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Name*")),
            ),
            SizedBox(height: 10),

            // Vehicle number field
            TextFormField(
              controller: vehicleNumberController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Vehicle Number*")),
            ),
            SizedBox(height: 20),

            // Create button
            ElevatedButton(
              onPressed: () {
                // Create the vehicle object
                final vehicle = Vehicle(
                  type: _selectedValue ?? '',
                  name: vehicleNameController.text,
                  vehicleNumber: vehicleNumberController.text,
                  imagePath: _image?.path,
                );

                // Add the AddVehicleEvent to the BLoC
                BlocProvider.of<VehicleBloc>(context).add(AddVehicleEvent(vehicle));
              },
              child: Text("Create Vehicle", style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent),
            ),

            // Listen for state changes (success or failure)
            BlocListener<VehicleBloc, VehicleState>(
              listener: (context, state) {
                if (state is VehicleLoading) {
                  // Optionally show a loading indicator
                } else if (state is VehicleSuccess) {
                  // On success, show a success message
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Vehicle added successfully')));
                } else if (state is VehicleFailure) {
                  // On failure, show the error message
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.error}')));
                }
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  // Show the image picker dialog
  void _showImagePickerDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Choose an Option"),
            content: SingleChildScrollView(
              child: ListBody(children: [
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Open Camera"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Open Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ]),
            ),
          );
        });
  }

  // Pick an image from the selected source

}
