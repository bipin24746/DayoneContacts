import 'package:flutter/material.dart';

class InviteGuest extends StatefulWidget {
  const InviteGuest({super.key});

  @override
  State<InviteGuest> createState() => _InviteGuestState();
}

class _InviteGuestState extends State<InviteGuest> {

  final List<Map<String,dynamic>> inviteList = [ {"letter":"A","name" : "Aayushman Singh Shrestha","phone":"9861158315",},
    {"letter":"A","name":"Aayush Karmacharya","phone":"9843700444"},
    {"letter":"A","name":"Suraj Shrestha","phone":"9861845236"},
    {"letter":"#","name":"*3243*","phone":"*3243*"},
    {"letter":"9","name":"9861158315","phone":"9861158315"}];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200
      ,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text("Invite 1 Guest",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            Divider(
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: inviteList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  final invite = inviteList[index];


                return Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          children: [

                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: Text(invite["letter"]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    invite["name"],
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                   invite["phone"],
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Icon(
                              Icons.cancel,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );}
              ),
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () {},
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
