import 'dart:developer';
import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/main_home_screen/pages/house_hold/house_hold.dart';
import 'package:dayonecontacts/main_home_screen/pages/house_hold/house_hold_widgets/added_vehicle.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_details_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@RoutePage()

class AddVehicles extends StatefulWidget {
  @override
  _AddVehiclesState createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehicles> {
  final _vehicleTypeController = TextEditingController();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  File? _image;

  final List<String> vehicleTypes = ["Car", "Bike", "Truck", "Bus"]; // Vehicle types for the dropdown

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery); // Or ImageSource.camera for camera

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _submitForm() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    if (authToken != null) {
      final uri = Uri.parse('https://housing-stagingserver.aitc.ai/api/v1/client/vehicle');
      final request = http.MultipartRequest('POST', uri)
        ..headers['Authorization'] = 'Bearer $authToken'
        ..fields['type'] = _vehicleTypeController.text
        ..fields['name'] = _nameController.text
        ..fields['noplate'] = _numberController.text;

      if (_image != null) {
        final imageStream = http.ByteStream(_image!.openRead());
        final imageLength = await _image!.length();
        final multipartFile = http.MultipartFile('file', imageStream, imageLength, filename: 'vehicle_image.jpg');
        request.files.add(multipartFile);
      }

      final response = await request.send();

      if (response.statusCode == 201) {
        // Successfully submitted
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Vehicle added successfully')));
      } else {
        // Error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to submit vehicle')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Vehicle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: vehicleTypes[0], // Default selected value
              onChanged: (value) {
                setState(() {
                  _vehicleTypeController.text = value ?? '';
                });
              },
              items: vehicleTypes.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'type'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'name'),
            ),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'noplate'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Choose Image'),
            ),
            SizedBox(height: 10),
            _image == null
                ? Text('No image selected')
                : Image.file(_image!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}


// class AddVehicles extends StatefulWidget {
//   const AddVehicles({super.key});
//
//   @override
//   State<AddVehicles> createState() => _AddVehiclesState();
// }
//
// class _AddVehiclesState extends State<AddVehicles> {
//   final List<String> vehicles = ["two_wheeler", "four_wheeler"];
//   String? _selectedValue;
//   File? _image;
//
//   TextEditingController vehicleNameController = TextEditingController();
//   TextEditingController vehicleNumberController = TextEditingController();
//
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path); // Store the picked image as a File
//       });
//     }
//   }
//
//
//
//   Future<void> vehicleAdded() async {
//     Dio dio = Dio();
//     final url = 'https://housing-stagingserver.aitc.ai/api/v1/client/vehicle';
//
//     final prefs = await SharedPreferences.getInstance();
//     final authToken = prefs.getString('authToken');
//
//     if (authToken == null) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Authorization token is missing.")));
//       return;
//     }
//
//     dio.options.headers = {
//       'Authorization': 'Bearer $authToken',
//       'Content-Type': 'application/json',
//     };
//
//     try {
//       log('file path: ${_image!.path}');
//
//       FormData formData = FormData.fromMap({
//         'type': _selectedValue,
//         'name': vehicleNameController.text,
//         'noplate': vehicleNumberController.text,
//         'file': _image != null
//             ? await MultipartFile.fromFile(_image!.path, filename: _image!.path.split('/').last)
//             : null,  // Ensure image is passed correctly
//       });
//
//
//
//
//       final response = await dio.post(url, data: formData);
//
//       if (response.statusCode == 201 && response.data['success'] == true) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Vehicle created successfully")));
//         // Handle image URL if response contains it
//         if (response.data['data']['file'] != null) {
//           final imageUrl = response.data['data']['file']['url'];
//           print("Image URL: $imageUrl");
//         }
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HouseHoldScreen()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data['message'] ?? 'Unknown error')));
//       }
//     } catch (e) {
//       print("Error during vehicle creation: $e");  // Log the error
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("An error occurred")));
//     }
//
//   }
//
//
//
//   void _showImagePickerDialog() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Choose an Option"),
//             content: SingleChildScrollView(
//               child: ListBody(children: [
//                 ListTile(
//                   leading: Icon(Icons.camera),
//                   title: Text("Open Camera"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     _pickImage(ImageSource.camera);
//                     Text("Open Camera");
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.image),
//                   title: Text("Open Gallery"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     _pickImage(ImageSource.gallery);
//                   },
//                 )
//               ]),
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Add Vehicle",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //upload photo
//             Center(
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: _showImagePickerDialog,
//                     child: Container(
//                       height: 100.0, // Set the height of the container
//                       width: 100.0,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: Stack(
//                         alignment: Alignment.center, // Center the image or icon
//                         children: [
//                           // If there's an image, display it
//                           _image != null
//                               ? ClipOval(
//                                   child: Image.file(
//                                     _image!,
//                                     fit: BoxFit.cover,
//                                     width: 100,
//                                     height: 100,
//                                   ),
//                                 )
//                               : const Icon(Icons
//                                   .car_repair), // If no image, don't display anything
//
//                           // Camera icon at the edge of the circle when no image
//                           _image == null
//                               ? Positioned(
//                                   bottom:
//                                       0, // Position at the bottom of the circle
//                                   right:
//                                       5, // Position at the right of the circle
//                                   child: Container(
//                                     padding: EdgeInsets.all(5),
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                       border: Border.all(
//                                           color: Colors.orange, width: 1),
//                                     ),
//                                     child: const Icon(
//                                       Icons.image,
//                                       color: Colors.orange,
//                                       size: 15,
//                                     ),
//                                   ),
//                                 )
//                               : const SizedBox
//                                   .shrink(), // Don't show the icon when an image is selected
//                         ],
//                       ),
//                     ),
//                   ),
//                   Text(
//                     "Upload Photo",
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//
//             SizedBox(
//               height: 20,
//             ),
//
//             //vehicle type dropdown
//             DecoratedBox(
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8.0, right: 8),
//                 child: DropdownButton<String>(
//                   value: _selectedValue,
//
//                   hint: const Text(
//                     "Vehicle type",
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//
//                   isExpanded: true, // Make dropdown button take full width
//                   items:
//                       vehicles.map<DropdownMenuItem<String>>((String vehicle) {
//                     return DropdownMenuItem<String>(
//                       value: vehicle,
//                       child: Text(vehicle),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedValue = newValue;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: vehicleNameController,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(), label: Text("Name*")),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: vehicleNumberController,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(), label: Text("Vehicle Number*")),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: SizedBox(
//           height: 50,
//           child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepOrangeAccent),
//               onPressed: vehicleAdded ,
//               child: Text(
//                 "Create",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               )),
//         ),
//       ),
//     );
//   }
// }


//
// if (isLoading)
// const Center(child: CircularProgressIndicator())
// else if (vehiclesList.isEmpty)
// const Center(child: Text("No vehicles added yet."))
// else
// Expanded(
// child: ListView.builder(
// itemCount: vehiclesList.length,
// itemBuilder: (context, index) {
// final vehicle = vehiclesList[index];
//
// return Container(
// height: 100,
// width: 10,
// decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10),),
// child: ListTile(
// leading: CircleAvatar(
// backgroundColor: Colors.blue,
// backgroundImage: vehicle['file'] != null &&
// vehicle['file'].isNotEmpty
// ? NetworkImage(
// vehicle['file']) // Load image from URL
//     : null,
// child:
// vehicle['file'] == null || vehicle['file'].isEmpty
// ? Text(
// vehicle['type'] == 'two_wheeler'
// ? "2-Wheeler"
//     : "4-Wheeler",
// textAlign: TextAlign.center,
// style: const TextStyle(
// fontSize: 10, color: Colors.white),
// )
//     : null,
// ),
// title: Text(vehicle['name'] ?? "Unknown Vehicle"),
// subtitle: Text("Plate No: ${vehicle['noplate']}"),
// ),
// );
// },
// ),
// ),
//
