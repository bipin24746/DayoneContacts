import 'package:flutter/material.dart';

class VehicleTypeDropdown extends StatelessWidget {
  final String? selectedValue;
  final Function(String?) onChanged;

  const VehicleTypeDropdown({
    Key? key,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: DropdownButton<String>(
          value: selectedValue,
          hint: const Text(
            "Vehicle type",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          isExpanded: true,
          items: ["two_wheeler", "four_wheeler"].map<DropdownMenuItem<String>>((String vehicle) {
            return DropdownMenuItem<String>(
              value: vehicle,
              child: Text(vehicle),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
