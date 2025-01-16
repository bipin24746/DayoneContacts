import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/staff_inside.dart';
import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/staff_status.dart';
import 'package:flutter/material.dart';

class PersonalStaffHome extends StatelessWidget {
  const PersonalStaffHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 320,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Personal Staff ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(4)",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.arrow_right),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(

                  height: 50,
                  width: 300, // Ensure the width is enough for the border-radius effect
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(50),
                    child: StaffStatus(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              StaffInside()
            ],
          ),
        ),
      ),
    );
  }
}
