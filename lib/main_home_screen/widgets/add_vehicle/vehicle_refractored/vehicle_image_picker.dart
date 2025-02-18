import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VehicleImagePicker extends StatelessWidget {
  final File? image;
  final Function(File) onImagePicked;

  const VehicleImagePicker({
    Key? key,
    required this.image,
    required this.onImagePicked,
  }) : super(key: key);

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  void _showImagePickerDialog(BuildContext context) {
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
                    _pickImage(ImageSource.camera, context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text("Open Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery, context);
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
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showImagePickerDialog(context),
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  image != null
                      ? ClipOval(
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  )
                      : const Icon(Icons.car_repair),
                  image == null
                      ? Positioned(
                    bottom: 0,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.orange, width: 1),
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
          const Text(
            "Upload Photo",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
