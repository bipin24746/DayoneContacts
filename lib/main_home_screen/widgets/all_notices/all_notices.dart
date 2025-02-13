import 'package:dayonecontacts/main_home_screen/widgets/current_notices/api_data/api_data.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/api_data/api_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AllNotices extends StatefulWidget {
  const AllNotices({super.key});

  @override
  State<AllNotices> createState() => _AllNoticesState();
}
class _AllNoticesState extends State<AllNotices> {
  Integration? ApiIntegration;
  var isLoaded = false;
  String sortOrder = "Latest";  // Track sorting order (Latest or Oldest)
  Map<int, bool> expandedStates = {};  // Map to track expansion for each notice

  @override
  void initState() {
    super.initState();
    ApiServices().getData();
    getData();
  }

  getData() async {
    ApiIntegration = await ApiServices().getData();
    if (ApiIntegration != null) {
      setState(() {
        isLoaded = true;
      });
      _sortData(); // Sort the data initially
    }
  }

  // Method to sort the data based on the selected order
  void _sortData() {
    if (sortOrder == "Latest") {
      ApiIntegration!.data.sort((a, b) => b.createdAt.compareTo(a.createdAt));  // Latest First
    } else if (sortOrder == "Oldest") {
      ApiIntegration!.data.sort((a, b) => a.createdAt.compareTo(b.createdAt));  // Oldest First
    }
    setState(() {}); // Rebuild the widget after sorting
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Notices",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.upload),
            onPressed: () {
              _showPopupMenu(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Action for settings icon
            },
          ),
        ],
        elevation: 8.0,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: ApiIntegration?.data.length,
          itemBuilder: (context, index) {
            // Format the createdAt field using the DateFormat class
            String formattedDate = DateFormat('MMM dd, yyyy').format(ApiIntegration!.data[index].createdAt);
            String formattedTime = DateFormat('hh:mm a').format(ApiIntegration!.data[index].createdAt);

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: expandedStates[index] == true ? null : 270,  // Use the map to track individual expansion
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      offset: Offset(0, 5),
                    ),
                  ],
                  color: Color(0xFFF9FAFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Center(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 25, right: 25),
                          child: Text(
                            ApiIntegration!.data[index].category,
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ApiIntegration!.data[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Row(
                            children: [
                              Text(formattedDate), // Display formatted date
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(formattedTime), // Display formatted time
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.orangeAccent.withOpacity(0.3),
                          ),
                          Text(
                            ApiIntegration!.data[index].message,
                            maxLines: expandedStates[index] == true ? 3 : 6,  // Check the expansion state for this notice
                            overflow: TextOverflow.ellipsis,
                          ),
                          // The Read More / Read Less button is always displayed
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                expandedStates[index] = !(expandedStates[index] ?? false);  // Toggle the expansion for the clicked index
                              });
                            },
                            child: Text(
                              expandedStates[index] == true ? "Read More" : "Read Less",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Method to show the popup menu and handle the sorting order
  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(200, 100, 0, 0),
      items: [
        PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.upgrade),
              SizedBox(width: 10),
              Text("Latest First"),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.download),
              SizedBox(width: 10),
              Text("Oldest First"),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == 1) {
        setState(() {
          sortOrder = "Latest";
        });
      } else if (value == 2) {
        setState(() {
          sortOrder = "Oldest";
        });
      }
      _sortData(); // Sort the data after selection
    });
  }
}
