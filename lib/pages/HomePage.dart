import 'package:dayonecontacts/pages/addFromContact.dart';
import 'package:dayonecontacts/pages/addManually.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                "Invite Guest",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              bottom: TabBar(tabs: [
                Tab(
                  child: DecoratedBox(decoration: BoxDecoration(border: Border.all()),child: Text("Add Manually"),),
                  
                ),
                Tab(
                  text: "Add From Contact",
                )
              ])),
          body: TabBarView(children: [
            Center(
                child:
              Addmanually(),
            ),
            Center(child: AddFromContact(),)
          ])),
    );
  }
}

// Row(
//   children: [
//     Row(
//       children: [
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 2,
//           height: 50,
//           child: DecoratedBox(decoration: BoxDecoration(border: Border.all()),child: Center(
//             child: Text("Add Manually",style: TextStyle(fontWeight: FontWeight.bold),),
//           ) ,),
//         )
//
//       ],
//     ),
//     Row(
//       children: [
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 2,
//           height: 50,
//           child: DecoratedBox(decoration: BoxDecoration(border: Border.all()),child: Center(
//             child: Text("Add From Contact",style: TextStyle(fontWeight: FontWeight.bold),),
//           ),),
//         )
//
//       ],
//     )
//   ],
// ),
