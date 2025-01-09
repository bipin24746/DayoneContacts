import 'package:flutter/material.dart';
import 'inviteGuest.dart'; // Make sure you import the InviteGuestPage

class Addmanually extends StatefulWidget {
  const Addmanually({super.key});

  @override
  State<Addmanually> createState() => _AddmanuallyState();
}

class _AddmanuallyState extends State<Addmanually> {
  int? selectedIndex;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool isValid = false;

  bool value = false;

  final _Name = TextEditingController();
  final _Number = TextEditingController();
  final List<String> Name = [];
  final List<String> Number = [];

  List<int> selectedMultiple = [];
  String? selectedName;
  String? selectedPhone;

  void submitForm() {
    setState(() {
      isValid = _form.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          onChanged: () {
            submitForm();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: _Name,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: _Number,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your phone number';
                    } else if (int.tryParse(value) == null) {
                      return 'Please input numbers only';
                    } else if (value.length != 10) {
                      return 'Enter 10 digit numbers';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isValid ? Colors.blue : Colors.white,
                      ),
                      onPressed: isValid
                          ? () {
                              submitForm();
                              if (isValid) {
                                Name.add(_Name.text);
                                Number.add(_Number.text);
                              }
                              _Name.clear();
                              _Number.clear();
                            }
                          : null,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: isValid ? Colors.white : Colors.black12,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Guest who are frequently visiting here will be shown here.",
                          style: TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
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
                        itemCount: Name.length,
                        itemBuilder: (context, index) {
                          final isSelected = selectedMultiple.contains(index);

                          return SizedBox(
                            width: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.orange.withOpacity(0.1)
                                          : Colors.white,
                                      border: Border.all(
                                          color: isSelected
                                              ? Colors.orange
                                              : Colors.black),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: CircleAvatar(
                                              child: Text(
                                                Name[index][0],
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? Colors.orange
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              radius: 22,
                                              backgroundColor: isSelected
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 8), // Add spacing
                                          Center(
                                              child: Text(
                                            Name[index],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: isSelected
                                                  ? Colors.orange
                                                  : Colors.black,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                          Center(
                                            child: Text(
                                              Number[index],
                                              style: TextStyle(
                                                color: isSelected
                                                    ? Colors.orange
                                                    : Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -8,
                                    right: -8,
                                    child: Transform.scale(
                                      scale: 1.2,
                                      child: Checkbox(
                                        checkColor:
                                            isSelected ? Colors.white : null,
                                        shape: CircleBorder(),
                                        value: isSelected,
                                        onChanged: (bool? newValue) {
                                          setState(() {
                                            if (newValue == true) {
                                              selectedMultiple.add(index);
                                              selectedName = Name[index];
                                              selectedPhone = Number[index];
                                            } else {
                                              selectedMultiple.remove(index);
                                              selectedName = null;
                                              selectedPhone = null;
                                            }
                                          });
                                        },
                                        activeColor: Colors.orange,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
