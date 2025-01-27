import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/staf_not_arrived.dart';
import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/staff_inside.dart';
import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/staff_left.dart';
import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/staff_status.dart';
import 'package:flutter/material.dart';

class PersonalStaffHome extends StatelessWidget {
  const PersonalStaffHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 320,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Personal Staff ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(4)",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_right),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(

                      child: TabBar(
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        indicatorPadding: EdgeInsets.symmetric(vertical: 12,), // Adjust the vertical position of the indicator
                        tabs: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Tab(text: "Inside(2)"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Tab(
                              text: "Left(2)",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Tab(
                              text: "Not arrived",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ),
                const SizedBox(height: 20),
                Expanded(
                  child: TabBarView(
                    children: [
                      StaffInside(),
                      PersonalStaffLeft(),
                      StaffNotArrived(),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Container(
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       Container(
//         height: 35,
//         width: 90,
//         decoration: BoxDecoration(
//           border: isPressed ? Border.all(color: Colors.green) : null,
//           color: isPressed ? Colors.green.withOpacity(0.1) : null,
//           borderRadius: isPressed ? BorderRadius.circular(50) : null,
//         ),
//         child: TextButton(
//           onPressed: () {ColorChange();},
//           child: Center(
//             child: Text(
//               "Inside (2)",
//               style: TextStyle(
//                   color: isPressed ? Colors.green : Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ),
//       Container(
//         height: 40,
//         width: 90,
//         decoration: BoxDecoration(),
//         child: TextButton(
//           onPressed: () {},
//           child: Center(
//             child: Text(
//               "Left (2)",
//               style: TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ),
//       Container(
//         height: 40,
//         width: 100,
//         decoration: BoxDecoration(),
//         child: TextButton(
//           onPressed: () {},
//           child: Center(
//             child: Text(
//               "Not arrived",
//               style: TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
//end staffstauts