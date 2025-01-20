import 'package:dayonecontacts/main_home_screen/widgets/current_notices/api_data/api_data.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
class CurrentNoticesHome extends StatefulWidget {
  const CurrentNoticesHome({super.key});

  @override
  State<CurrentNoticesHome> createState() => _CurrentNoticesHomeState();
}

class _CurrentNoticesHomeState extends State<CurrentNoticesHome> {
  Cart? cart;
  Future<void> getData() async{
    String apiUrl = "https://dummyjson.com/carts";
    try{
      Response response = await Dio().get(apiUrl);
      if(response.data != null){
        setState(() {
          cart = Cart.fromJson(response.data);
        });
      }
      else
        {
          throw Exception("Api response is null or in an unexpected format");
        }
    }
    catch (e){
      print(e.toString());
    }
  }

  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(height: 500,
      color: Colors.orangeAccent.withOpacity(0.1),
      child: cart == null ? Center(child: CircularProgressIndicator(),) :  GridView.builder(
          itemCount: cart!.carts!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context,index){
            return Material(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(cart!.carts![index].products![3].thumbnail ?? "",height: 50,width: 50,),
            );
          }, ),
    );
}}
// import 'package:flutter/material.dart';
//
// class CurrentNoticesHome extends StatelessWidget {
//
//   const CurrentNoticesHome({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 550,
//       color: Colors.orangeAccent.withOpacity(0.1),
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "Current Notices",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "View all",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(Icons.arrow_right),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 children: [
//                   Center(
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             top: 5, bottom: 5, left: 25, right: 25),
//                         child: Text(
//                           "Society Programe",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Blood Donation Programme",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                         Row(
//                           children: [
//                             Text("Nov 16, 2023"),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 18.0),
//                               child: Text("12:15 AM"),
//                             )
//                           ],
//                         ),
//                         Divider(
//                           thickness: 2,
//                           color: Colors.orangeAccent.withOpacity(0.3),
//                         ),
//                         Text(
//                           "Please contact with admin to understand the necessary documents to be include for this application process. More Information part is okay",
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 children: [
//                   Center(
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             top: 5, bottom: 5, left: 25, right: 25),
//                         child: Text(
//                           // category
//                           "Society Programe",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           // title
//                           "Blood Donation Programme",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                         Row(
//                           children: [
//                             // createdat
//                             Text("Nov 16, 2023"),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 18.0),
//                               child: Text("12:15 AM"),
//                             )
//                           ],
//                         ),
//                         Divider(
//                           thickness: 2,
//                           color: Colors.orangeAccent.withOpacity(0.3),
//                         ),
//                         Text(
//                           // message
//                           "Please contact with admin to understand the necessary documents to be include for this application process. More Information part is okay",
//                           maxLines: 3, overflow: TextOverflow.ellipsis,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Container(
//   width: MediaQuery.of(context).size.width,
//   height: 200,
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(16),
//   ),
//   child: Column(
//     children: [
//       Center(
//         child: DecoratedBox(
//           decoration: BoxDecoration(
//             color: Colors.black,
//             border: Border.all(),
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 top: 5, bottom: 5, left: 25, right: 25),
//             child: Text(
//               "Society Programe",
//               style: TextStyle(
//                   color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ),
//       SizedBox(
//         height: 10,
//       ),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Blood Donation Programme",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             Row(
//               children: [
//                 Text("Nov 16, 2023"),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 18.0),
//                   child: Text("12:15 AM"),
//                 )
//               ],
//             ),
//             Divider(thickness: 2,color: Colors.orangeAccent.withOpacity(0.3),),
//             Text("Please contact with admin to understand the necessary documents to be include for this application process. More Information part is okay",maxLines: 3,overflow: TextOverflow.ellipsis,)
//           ],
//         ),
//       )
//     ],
//   ),
// )
