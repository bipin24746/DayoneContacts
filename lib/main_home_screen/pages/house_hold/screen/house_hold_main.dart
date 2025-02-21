import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/main_home_screen/pages/house_hold/house_hold_widgets/added_vehicle.dart';
import 'package:dayonecontacts/main_home_screen/pages/house_hold/house_hold_widgets/house_hold_add_vehicles.dart';
import 'package:dayonecontacts/main_home_screen/pages/house_hold/house_hold_widgets/house_hold_title.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../house_hold_service/house_hold_model.dart';

@RoutePage()
class HouseHoldMain extends StatelessWidget {
  final String vehicleType;
  final String vehicleName;
  final String vehicleNumber;
  final File? vehicleImage;

  const HouseHoldMain({super.key, required this.vehicleType,
    required this.vehicleName,
    required this.vehicleNumber,
    this.vehicleImage,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          "Household",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [HouseHoldTitle()],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  AutoRouter.of(context).push(AddVehiclesRoute());
                },
                child: HouseHoldAddVehicle(),
              ),
              HouseHoldAddedVehicle(vehicleName: vehicleName, vehicleType: vehicleType, vehicleNumber: vehicleNumber,vehicleImage: vehicleImage,), // Pass the vehicle data to the widget
            ],
          ),
        ],
      ),
    );
  }
}