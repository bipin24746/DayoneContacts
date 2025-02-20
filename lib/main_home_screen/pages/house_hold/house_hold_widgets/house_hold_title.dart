import 'package:flutter/material.dart';

class HouseHoldTitle extends StatelessWidget {
  const HouseHoldTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child:  Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: Icon(
              Icons.car_repair,
              color: Colors.deepOrangeAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Vehicles",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black45),
            ),
          ),
        ],
      ),
    ),);
  }
}
