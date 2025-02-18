import 'package:flutter/material.dart';

class ConnectHomeContainer extends StatelessWidget {
  const ConnectHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 25.0,

        ),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,

            borderRadius: BorderRadius.only(
              topRight: Radius.circular(200),
            ),
          ),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Strengthening Bonds,",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Ensuring Safety.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              2, // Ensures the Divider spans the full width
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Text("Connect Home",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -26,
              right: 70,
              child: Icon(
                Icons.home,
                color: Colors.red,
                size: 150,
              ),
            ),
            Positioned(
              bottom: -30,
              right: -35,
              child: Icon(
                Icons.home,
                color: Colors.deepOrangeAccent,
                size: 170,
              ),
            ),
            Positioned(
              bottom: -35,
              right: 0,
              child: Icon(
                Icons.home,
                color: Colors.grey,
                size: 200,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
