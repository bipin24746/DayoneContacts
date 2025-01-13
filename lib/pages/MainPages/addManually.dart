import 'package:dayonecontacts/pages/widgets/addManuallyRefractored/ContactCard.dart';

import 'package:dayonecontacts/pages/widgets/addManuallyRefractored/SubmitButton.dart';
import 'package:dayonecontacts/pages/widgets/addManuallyRefractored/VisitorList.dart';
import 'package:dayonecontacts/pages/widgets/addManuallyRefractored/nameFromField.dart';
import 'package:dayonecontacts/pages/widgets/addManuallyRefractored/numberFormField.dart';

import 'package:flutter/material.dart';

class AddManually extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) selectContacts;
  const AddManually({super.key, required this.selectContacts});

  @override
  State<AddManually> createState() => _AddManuallyState();
}

class _AddManuallyState extends State<AddManually> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final List<String> names = [];
  final List<String> numbers = [];
  final List<int> selectedIndexes = [];

  bool _isFormValid = true;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _numberController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.removeListener(_validateForm);
    _numberController.removeListener(_validateForm);
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _nameController.text.isNotEmpty &&
        _numberController.text.isNotEmpty &&
        int.tryParse(_numberController.text) != null &&
        _numberController.text.length == 10;

    if (_isFormValid != isValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        names.add(_nameController.text);
        numbers.add(_numberController.text);
        _nameController.clear();
        _numberController.clear();
        _isFormValid = false; // Reset button state after submission.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              nameFormFieldWidgets(
                controller: _nameController,
                hintText: 'Enter Name',
              ),

              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextFormField(
              //     controller: _nameController,
              //     decoration: const InputDecoration(
              //       hintText: "Name",
              //       border: OutlineInputBorder(),
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter a name';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              NumberFormField(
                controller: _numberController,
                hinttext: 'Enter Number',
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextFormField(
              //
              //     controller: _numberController,
              //     decoration: const InputDecoration(
              //       hintText: "Mobile Number",
              //       border: OutlineInputBorder(),
              //     ),
              //     keyboardType: TextInputType.number,
              //   ),
              // ),
              SubmitButton(
                isFormValid: _isFormValid,
                submitForm: () {
                  _submitForm();
                },
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //     child: ElevatedButton(
              //       onPressed: _isFormValid ? _submitForm : null,
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor:
              //             _isFormValid ? Colors.blue : Colors.grey, // Optional
              //       ),
              //       child: const Text(
              //         "Submit",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Divider(color: Colors.grey, thickness: 1),
              ),
              VisitorListone(
                title: "Frequent Visitor List",
                description:
                    "Guests who frequently visit here will be shown here.",
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         "Frequent Visitor List",
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 17,
              //         ),
              //       ),
              //       const SizedBox(height: 8),
              //       const Text(
              //         "Guests who frequently visit here will be shown here.",
              //         style: TextStyle(fontSize: 13),
              //       ),
              //       const SizedBox(height: 20),
              //     ],
              //   ),
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndexes.contains(index);
                    return ContactCard(
                        name: names[index],
                        numbers: numbers[index],
                        isSelected: isSelected,
                        onToggleSelection: () {
                          setState(() {
                            if (isSelected) {
                              selectedIndexes.remove(index);
                            } else {
                              selectedIndexes.add(index);
                            }
                            widget.selectContacts(
                              selectedIndexes
                                  .map((i) => {
                                        'name': names[i],
                                        'number': numbers[i],
                                      })
                                  .toList(),
                            );
                          });
                        });
                    // return SizedBox(
                    //   width: 140,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Stack(
                    //       children: [
                    //         DecoratedBox(
                    //           decoration: BoxDecoration(
                    //             color: isSelected
                    //                 ? Colors.orange.withOpacity(0.1)
                    //                 : Colors.white,
                    //             border: Border.all(
                    //               color:
                    //                   isSelected ? Colors.orange : Colors.black,
                    //             ),
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 CircleAvatar(
                    //                   child: Text(
                    //                     names[index][0],
                    //                     style: TextStyle(
                    //                       color: isSelected
                    //                           ? Colors.orange
                    //                           : Colors.black,
                    //                       fontWeight: FontWeight.bold,
                    //                     ),
                    //                   ),
                    //                   radius: 22,
                    //                   backgroundColor: isSelected
                    //                       ? Colors.white
                    //                       : Colors.grey,
                    //                 ),
                    //                 const SizedBox(height: 8),
                    //                 Center(
                    //                   child: Text(
                    //                     names[index],
                    //                     style: TextStyle(
                    //                       color: isSelected
                    //                           ? Colors.orange
                    //                           : Colors.black,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Text(
                    //                   numbers[index],
                    //                   style: TextStyle(
                    //                     color: isSelected
                    //                         ? Colors.orange
                    //                         : Colors.black,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         Positioned(
                    //           top: -8,
                    //           right: -8,
                    //           child: Transform.scale(
                    //             scale: 1.2,
                    //             child: Checkbox(
                    //               value: isSelected,
                    //               onChanged: (bool? value) {
                    //                 setState(() {
                    //                   if (value == true) {
                    //                     selectedIndexes.add(index);
                    //                   } else {
                    //                     selectedIndexes.remove(index);
                    //                   }
                    //                   widget.selectContacts(
                    //                     selectedIndexes
                    //                         .map((i) => {
                    //                               'name': names[i],
                    //                               'number': numbers[i],
                    //                             })
                    //                         .toList(),
                    //                   );
                    //                 });
                    //               },
                    //               activeColor: Colors.orange,
                    //               shape: const CircleBorder(),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
