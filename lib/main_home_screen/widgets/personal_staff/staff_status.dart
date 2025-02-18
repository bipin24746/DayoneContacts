import 'package:flutter/material.dart';

class StaffStatus extends StatefulWidget {
  const StaffStatus({super.key});

  @override
  State<StaffStatus> createState() => _StaffStatusState();
}

class _StaffStatusState extends State<StaffStatus> {
  @override
  Widget build(BuildContext context) {
    bool isPressed = true;
    void ColorChange() {
      setState(() {
        isPressed = !isPressed;
      });
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 35,
            width: 90,
            decoration: BoxDecoration(
              border: isPressed ? Border.all(color: Colors.green) : null,
              color: isPressed ? Colors.green.withOpacity(0.1) : null,
              borderRadius: isPressed ? BorderRadius.circular(50) : null,
            ),
            child: TextButton(
              onPressed: () {ColorChange();},
              child: Center(
                child: Text(
                  "Inside (2)",
                  style: TextStyle(
                      color: isPressed ? Colors.green : Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 90,
            decoration: BoxDecoration(),
            child: TextButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  "Left (2)",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(),
            child: TextButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  "Not arrived",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// return DefaultTabController(
//   length: 3,
//   child: Scaffold(
//     appBar: AppBar(
//       title: const Text('Custom Tabs'),
//       bottom: TabBar(
//         indicator: BoxDecoration(
//
//           borderRadius: BorderRadius.circular(50),
//         ),
//         tabs: [
//           Tab(
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               child: SizedBox(
//                 height: 25,
//
//                 child: Center(child: const Text("Invite (2)")),
//               ),
//             ),
//           ),
//           Tab(
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: SizedBox(
//                   height: 25,
//
//                   child: Center(child: const Text("Left")),
//                 ),
//               ),
//             ),
//           ),
//           Tab(
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: SizedBox(
//                   height: 25,
//                   child: Center(child: const Text("Not Arrived")),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//     body: const TabBarView(
//       children: [
//         Center(child: Text("Inside Content")),
//         Center(child: Text("Left Content")),
//         Center(child: Text("Not Arrived Content")),
//       ],
//     ),
//   ),
// );
