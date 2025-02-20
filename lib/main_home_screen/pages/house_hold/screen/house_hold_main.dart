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
  final Data vehicleData; // Accept the vehicle data as an argument

  const HouseHoldMain({super.key, required this.vehicleData});

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
                  AutoRouter.of(context).push(AddVehiclePageRoute());
                },
                child: HouseHoldAddVehicle(),
              ),
              HouseHoldAddedVehicle(vehicle: vehicleData), // Pass the vehicle data to the widget
            ],
          ),
        ],
      ),
    );
  }
}