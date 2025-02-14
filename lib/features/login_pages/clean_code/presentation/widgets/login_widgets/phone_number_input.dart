import 'package:flutter/material.dart';

class BlocPhoneNumberInput extends StatelessWidget {
  final TextEditingController phoneNoController;

  const BlocPhoneNumberInput({super.key, required this.phoneNoController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "BEGIN YOUR JOURNEY TO HOME",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Please enter your mobile number to create your account.",
            style: TextStyle(fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Icon(Icons.flag, color: Colors.red),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: phoneNoController,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
