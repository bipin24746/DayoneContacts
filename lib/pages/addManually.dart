import 'package:flutter/material.dart';

class Addmanually extends StatefulWidget {
  const Addmanually({super.key});

  @override
  State<Addmanually> createState() => _AddmanuallyState();
}

class _AddmanuallyState extends State<Addmanually> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: TextFormField(
              decoration: InputDecoration(
            hintText: "Mobile Number",

                border: OutlineInputBorder(),

              ),keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 20,),

        ],
      )

    );
  }
}
