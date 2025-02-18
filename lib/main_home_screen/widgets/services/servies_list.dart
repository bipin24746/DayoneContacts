import 'package:flutter/material.dart';

final List<Map<String,dynamic>> serviceLists = [
  {"icon": Icons.payment, "serviceName": "Payment"},
  {"icon": Icons.house, "serviceName": "Rent"},
  {"icon": Icons.clean_hands, "serviceName": "Complaints"},
  {"icon": Icons.sports_gymnastics, "serviceName": "Amenities"},
  {"icon": Icons.local_police, "serviceName": "Guard"},
  {"icon": Icons.sos, "serviceName": "SOS"},
];

//
// import 'package:dayonecontacts/main_home_screen/widgets/services/servies_list.dart';
// import 'package:flutter/material.dart';
//
// class ServicesHome extends StatelessWidget {
//   const ServicesHome({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       width: 500,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Divider(),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Services",
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               height: 500,
//               width: 500,
//               child: ListView.builder(
//                 itemCount: serviceLists.length,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   final service = serviceLists[index];
//                   return Container(
//
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         children: [
//
//                           Icon( service["icon"])
//
//
//                           ,
//                           Text(  service["serviceName"])
//
//
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
