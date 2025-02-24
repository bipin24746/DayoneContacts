import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/main_home_screen/pages/house_hold/house_hold.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/presentation/bloc/add_vehicle_bloc.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final List<String> vehicles = ["two_wheeler", "four_wheeler"];
  String? _selectedValue;
  File? _image;

  final TextEditingController vehicleNameController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose an Option"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text("Open Camera"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text("Open Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddVehicleBloc>(),
      child: Builder(
        builder: (context) {
          return BlocListener<AddVehicleBloc, AddVehicleState>(
            listener: (context, state) {
              if (state is AddVehicleSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Vehicle Added Successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
                AutoRouter.of(context).push(HouseHoldScreenRoute());
              } else if (state is AddVehicleErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${state.errorMessage}'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Add Vehicle",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<AddVehicleBloc, AddVehicleState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Upload photo
                        Center(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: _showImagePickerDialog,
                                child: Container(
                                  height: 100.0,
                                  width: 100.0,
                                  decoration: const BoxDecoration(
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
                                      if (_image == null)
                                        Positioned(
                                          bottom: 0,
                                          right: 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
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
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              const Text(
                                "Upload Photo",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Vehicle type dropdown
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton<String>(
                              value: _selectedValue,
                              hint: const Text(
                                "Vehicle type",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              isExpanded: true,
                              items: vehicles
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
                        const SizedBox(height: 10),

                        // Name Input
                        TextFormField(
                          controller: vehicleNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Name*",
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Vehicle Number Input
                        TextFormField(
                          controller: vehicleNumberController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Vehicle Number*",
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Loading indicator
                        if (state is AddVehicleLoading)
                          const Center(child: CircularProgressIndicator()),
                      ],
                    );
                  },
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    onPressed: () {
                      if (_selectedValue == null ||
                          vehicleNameController.text.isEmpty ||
                          vehicleNumberController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      context.read<AddVehicleBloc>().add(
                        SubmitVehicleEvent(
                          type: _selectedValue!,
                          name: vehicleNameController.text,
                          noplate: vehicleNumberController.text,
                          image: _image,
                        ),
                      );
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
