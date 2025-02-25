import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle_clean_code/presentation/bloc/vehicle_bloc.dart';
import 'package:dayonecontacts/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GetVehiclePage extends StatefulWidget {
  const GetVehiclePage({super.key});

  @override
  State<GetVehiclePage> createState() => _GetVehiclePageState();
}

class _GetVehiclePageState extends State<GetVehiclePage> {
  List<dynamic> vehiclesLists = [];
  bool isLoaded = true;

  void _vehiclePopUp(Map<String, dynamic> vehicle) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2.4,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  vehicle['name'] ?? "Unknown", // Ensure fallback for null values
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(thickness: 1),
              ),
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(vehicle['image']['url'] ?? ''), // Fallback to empty string
              ),
              SizedBox(height: 10),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  child: Text(
                    vehicle['type'] ?? "Unknown", // Ensure fallback for null values
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                vehicle['noplate'] ?? "Unknown Plate", // Ensure fallback for null values
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final vehicleBloc = sl<VehicleBloc>();
        log("Fetching vehicles...");
        vehicleBloc.add(FetchVehiclesEvent());
        return vehicleBloc;
      },
      child: Builder(
        builder: (context) {
          return BlocListener<VehicleBloc, VehicleState>(
            listener: (context, state) {
              if (state is VehicleSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Vehicle fetched Successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is VehicleFailure) {
                log("Error: ${state.error}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Failed to fetch vehicles: ${state.error}"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Vehicles",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              body: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(AddVehiclePageRoute());
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blue,
                                Colors.lightBlueAccent,
                                Colors.white,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add, color: Colors.white, size: 30),
                              SizedBox(height: 5),
                              Text(
                                "Add Vehicle",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<VehicleBloc, VehicleState>(
                          builder: (context, state) {
                            if (state is VehicleLoading) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (state is VehicleFetchedSuccess) {
                              if (state.vehicles.isEmpty) {
                                return const Center(child: Text("No vehicles available."));
                              }
                              return GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                itemCount: state.vehicles.length,
                                itemBuilder: (context, index) {
                                  final vehicle = state.vehicles[index];

                                  return GestureDetector(
                                    onTap: () => _vehiclePopUp(vehicle as Map<String, dynamic>),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4.0),
                                            child: CircleAvatar(
                                              radius: 23,
                                              backgroundImage: NetworkImage(vehicle.type),
                                            ),
                                          ),
                                          Text(vehicle.name, style: TextStyle(fontWeight: FontWeight.bold)),
                                          DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                              child: Text(
                                                vehicle.type,
                                                style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (state is VehicleFailure) {
                              return Center(child: Text(state.error));
                            } else {
                              return const Center(child: Text("No Vehicle Available"));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
