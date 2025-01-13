import 'package:flutter/material.dart';

class addContactDetails extends StatelessWidget {
  final String contactletter;
  final String contactName;
  final int contactPhone;
  const addContactDetails({super.key, required this.contactletter, required this.contactName, required this.contactPhone});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
            child: Text(contactletter,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 2),
                child: Text(contactName,style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 2),
                child: Text(contactPhone.toString(),style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
