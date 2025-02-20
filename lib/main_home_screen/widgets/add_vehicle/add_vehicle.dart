import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class AddVehicles extends StatefulWidget {
  const AddVehicles({super.key});

  @override
  State<AddVehicles> createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehicles> {
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

  Future<void> vehicleAdded() async {
    Dio dio = Dio();
    final url = 'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle';

    // Declare authToken early and retrieve it from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken'); // Retrieve the auth token

    // Ensure the token is not null before proceeding
    if (authToken == null) {
      print('No authorization token found');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Authorization token is missing.")));
      return; // Exit if no token exists
    }

    // Set headers after ensuring token is available
    dio.options.headers = {
      'Authorization': 'Bearer $authToken', // Add the token to headers
      'Content-Type':
          'application/json', // Make sure you set the correct content type
    };

    try {
      // Prepare data for the request
      final data = {
        'type': _selectedValue, // Use the selected vehicle type
        'name': vehicleNameController.text,
        'noplate': vehicleNumberController.text,
        'file': _image != null
            ? await MultipartFile.fromFile(_image!.path, filename: "")
            : '', // Attach file if selected
      };

      FormData formData = FormData.fromMap(data);

      final response = await dio.post(
        url,
        data: formData, // Send form data for file upload
      );

      if (response.statusCode == 201) {
        // Check the success status from response
        final responseData = response.data;
        if (responseData['success'] == true) {
          // Display success message
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Vehicle created successfully")));
        } else {
          // Handle error based on response message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(responseData['message'] ?? 'Unknown error')));
        }
      } else {
        // Handle unexpected errors (non-200 status codes)
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Errors: ${response.statusCode}")));
      }
    } catch (e) {
      print("Error: $e");
      if (e is DioError) {
        print("Dio Error: ${e.response?.data}");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Dio Error: ${e.response?.data}")));
      } else {
        // Generic error
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("An error occurred")));
      }
    }
  }

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
                    Text("Open Camera");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Open Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                )
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Vehicle",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //upload photo
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _showImagePickerDialog,
                    child: Container(
                      height: 100.0, // Set the height of the container
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        alignment: Alignment.center, // Center the image or icon
                        children: [
                          // If there's an image, display it
                          _image != null
                              ? ClipOval(
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              : const Icon(Icons
                                  .car_repair), // If no image, don't display anything

                          // Camera icon at the edge of the circle when no image
                          _image == null
                              ? Positioned(
                                  bottom:
                                      0, // Position at the bottom of the circle
                                  right:
                                      5, // Position at the right of the circle
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
                              : const SizedBox
                                  .shrink(), // Don't show the icon when an image is selected
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Upload Photo",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //vehicle type dropdown
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
                    "Vehicle type",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),

                  isExpanded: true, // Make dropdown button take full width
                  items:
                      vehicles.map<DropdownMenuItem<String>>((String vehicle) {
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
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: vehicleNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Name*")),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: vehicleNumberController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Vehicle Number*")),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent),
              onPressed: vehicleAdded,
              child: Text(
                "Create",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
