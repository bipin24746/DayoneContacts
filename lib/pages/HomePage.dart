import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dayonecontacts/pages/addFromContact.dart';
import 'package:dayonecontacts/pages/addManually.dart';
import 'package:dayonecontacts/pages/inviteGuest.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> selectedGuests = [];
  List<Map<String, dynamic>> selected = [];

  void updateSelectedGuests(List<Map<String, dynamic>> guests) {
    setState(() {
      selectedGuests = guests;
    });
  }

  void updateSelectedContacts(List<Map<String, dynamic>> contacts) {
    setState(() {
      selected = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              "Invite Guest",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            bottom: ButtonsTabBar(
              backgroundColor: Color(0xFF34405F),
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              radius: 0,
              unselectedLabelStyle: TextStyle(color: Colors.black),
              contentCenter: true,
              tabs: [
                Tab(
                  text: "Add Manually",
                ),
                Tab(
                  text: "Add From Contact",
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: AddManually(
                        selectContacts: updateSelectedContacts,
                      ),
                    ),
                    Center(
                      child: AddFromContact(
                        selectedContacts: updateSelectedGuests,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.black)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InviteGuest(
                      selectedContacts: selectedGuests,
                      selectContacts: selected,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
