import 'package:flutter/material.dart';

class AddFromContact extends StatefulWidget {
  const AddFromContact({super.key});

  @override
  State<AddFromContact> createState() => _AddFromContactState();
}

class _AddFromContactState extends State<AddFromContact> {
  bool? value = false;
  List<int> multipleSelected = [];
  final List<Map<String,dynamic>> contacts = [
    {"letter":"A","name" : "Aayushman Singh Shrestha","phone":"9861158315",},
    {"letter":"A","name":"Aayush Karmacharya","phone":"9843700444"},
    {"letter":"A","name":"Suraj Shrestha","phone":"9861845236"},
    {"letter":"#","name":"*3243*","phone":"*3243*"},
    {"letter":"9","name":"9861158315","phone":"9861158315"}
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context,index){
            final isSelects = multipleSelected.contains(index);
        final contact = contacts[index];
        return  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 25,
                    child: Text(contact["letter"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 2),
                        child: Text(contact["name"]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 2),
                        child: Text(contact["phone"]),
                      )
                    ],
                  ),
                  Spacer(),
                  InkWell(onTap: (){
                    if(isSelects){
                      multipleSelected.remove(index);
                    }
                    else{
                      multipleSelected.add(index);
                    }
                  },
                    child: Checkbox(
                    checkColor: isSelects ? Colors.black : null,
                        value: isSelects,
                        onChanged: (bool? newValue) {
                          setState(() {
                            if(newValue == true){
                              multipleSelected.add(index);

                            }
                            else
                              {
                                multipleSelected.remove(index);
                              }

                            // value = newValue;
                          });
                        }),
                  )
                ],
              ),
            ),
            Divider(thickness: 1,)
          ],
        );
      }),


    );
  }
}
