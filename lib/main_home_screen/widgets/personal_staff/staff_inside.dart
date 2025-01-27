import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/inside_staff_list.dart';
import 'package:flutter/material.dart';

class StaffInside extends StatelessWidget {
  const StaffInside({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: InsideStaffList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
            final peoples = InsideStaffList[index];

            return  Row(
              mainAxisAlignment:
              MainAxisAlignment.start, // Center the Row content
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey, width: 2), // Add border width
                            image: DecorationImage(
                              image: AssetImage(peoples["images"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 2,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       peoples["name"],
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                        height: 25,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text(
                                peoples["position"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.white),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.call),
                    Text(
                      "Call",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            );
          },),)

        ],
      ),
    );
  }
}
