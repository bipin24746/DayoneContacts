import 'package:flutter/material.dart';

class InviteGuest extends StatefulWidget {
  final List<Map<String, dynamic>> selectedContacts;
  final List<Map<String, dynamic>> selectContacts;

  const InviteGuest({
    super.key,
    required this.selectedContacts,
    required this.selectContacts,
  });

  @override
  State<InviteGuest> createState() => _InviteGuestState();
}

class _InviteGuestState extends State<InviteGuest> {
  @override
  Widget build(BuildContext context) {
    // Combine both lists for display purposes.
    final allContacts = [
      ...widget.selectedContacts.map((contact) => {
        ...contact,
        "type": "Selected", // Add type to identify the list.
      }),
      ...widget.selectContacts.map((contact) => {
        ...contact,
        "type": "Select", // Add type to identify the list.
      }),
    ];

    // Debug: Print contacts to verify.
    print("All Contacts: $allContacts");

    // Check if the combined contact list is empty.
    if (allContacts.isEmpty) {
      return const SizedBox.shrink(); // Return an invisible widget if empty.
    }

    return Container(
      color: Colors.white,
      height: 195,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Invite Guests",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(thickness: 1),
            Expanded(
              child: ListView.builder(
                itemCount: allContacts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final contact = allContacts[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // CircleAvatar with the first letter of the name.
                        CircleAvatar(
                          radius: 20,
                          child: Text(
                            contact["name"]?.isNotEmpty == true
                                ? contact["name"]![0].toUpperCase()
                                : "?",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Display name and phone number.
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              contact["name"] ?? "Unknown",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              contact["number"]?.isNotEmpty == true
                                  ? contact["number"]
                                  : "No phone",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        // Cancel button to remove contact.
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (contact["type"] == "Selected") {
                                widget.selectedContacts.removeWhere(
                                      (c) => c["name"] == contact["name"],
                                );
                              } else if (contact["type"] == "Select") {
                                widget.selectContacts.removeWhere(
                                      (c) => c["name"] == contact["name"],
                                );
                              }
                            });
                          },
                          child: const Icon(Icons.cancel, color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {},
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}