import 'package:dayonecontacts/main_home_screen/widgets/visitors_list/visitors_list.dart';
import 'package:flutter/material.dart';

class HomeVisitors extends StatefulWidget {
  @override
  State<HomeVisitors> createState() => _HomeVisitorsState();
}

class _HomeVisitorsState extends State<HomeVisitors> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isExpanded ? 330 : null,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white30,
      ),
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Visitors",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                " (6)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text("View all"),
              Icon(Icons.arrow_right),
            ],
          ),
          SizedBox(height: 15),

          // Visitors Row
          Row(
            children: [
              // Add Visitor Button
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  height: 95,
                  width: 80,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            isExpanded
                                ? Column(
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        "Close",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ) : Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  "Add Visitor",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),

              // Active Visitors List
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      activeStatus.length,
                      (index) {
                        final people = activeStatus[index];
                        final isOnline = people['status'] == 'online';

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        isOnline ? Colors.green : Colors.grey,
                                    width: 3,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    // Profile Image
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        width: 70,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(people['images']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      top: 10,
                                      right: 2,
                                      child: Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isOnline
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            people['shared'],
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                people['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),

          if (isExpanded)
            Container(
              child: Column(
                children: [
                  Divider(
                    thickness: 1,
                    color: Colors.red,
                  ),
                  Row(
                    children: [
                      Text(
                        "Allow future entries for easy way to get in from the gate.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(hiddenVisitors.length, (index) {
                          final visibleItem =
                              hiddenVisitors[index]; // Access the map
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Icon(
                                  visibleItem[
                                      "iconVisible"], // Access the icon key
                                  size: 50,
                                ),
                                SizedBox(height: 5), // Add spacing
                                Text(
                                  visibleItem["text"], // Access the text key
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
