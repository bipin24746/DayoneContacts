import 'package:flutter/material.dart';

class Addmanually extends StatefulWidget {
  const Addmanually({super.key});

  @override
  State<Addmanually> createState() => _AddmanuallyState();
}

class _AddmanuallyState extends State<Addmanually> {
  bool? value = false;
  final List<Map<String, dynamic>> Visitors = [
    {
      "letter": "A",
      "name": "Aayushman Singh Shrestha",
      "phone": "9861158315",
    },
    {"letter": "A", "name": "Aayush Karmacharya", "phone": "9843700444"},
    {"letter": "A", "name": "Suraj Shrestha", "phone": "9861845236"},
    {"letter": "#", "name": "*3243*", "phone": "*3243*"},
    {"letter": "9", "name": "9861158315", "phone": "9861158315"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Mobile Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white54),
                      onPressed: () {},
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Frequent Visitor List",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Guest who are frequently visiting here will be shown here.",
                        style: TextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Visitors.length,
                      itemBuilder: (context, index) {
                        final Visitor = Visitors[index];
                        return SizedBox(
                          width: 140,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(children: [
                              DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: CircleAvatar(
                                            child: Text(
                                              Visitor["letter"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            radius: 22,
                                            backgroundColor: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 8), // Add spacing
                                        Center(
                                            child: Text(
                                          Visitor["name"],
                                          style: TextStyle(fontSize: 15),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        Center(child: Text(Visitor["phone"])),
                                      ],
                                    ),
                                  )),
                              Positioned(
                                top: -8,
                                right: -8,
                                child: Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        shape: CircleBorder(),
                                        value: value,
                                        onChanged: (bool? newValue) {
                                          setState(() {
                                            value = newValue;
                                          });
                                        })),
                              )
                            ]),
                          ),
                        );
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
