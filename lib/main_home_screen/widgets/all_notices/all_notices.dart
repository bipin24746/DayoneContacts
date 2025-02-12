import 'package:dayonecontacts/main_home_screen/widgets/current_notices/api_data/api_data.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/api_data/api_services.dart';
import 'package:flutter/material.dart';

class AllNotices extends StatefulWidget {
  const AllNotices({super.key});

  @override
  State<AllNotices> createState() => _AllNoticesState();
}

class _AllNoticesState extends State<AllNotices> {
  bool _isExpanded = false; // Track if the text is expanded or not

  Integration? ApiIntegration;
  var isLoaded = false;
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
    }
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
          // itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: _isExpanded ? null : 200, // Dynamically increase height when expanded
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
                            // "Society Program", // Placeholder text
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(

                            ApiIntegration!.data[index].title,
                            // "Blood Donation Programme",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Row(
                            children: [
                              Text("Nov 16, 2023"),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text("12:15 AM"),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.orangeAccent.withOpacity(0.3),
                          ),
                          // Text content with dynamic size
                          Text(
                            "Please contact with admin to understand the necessary documents to be included for this application process. More information part is okay.Please contact with admin to understand the necessary documents to be included for this application process. More information part is okay.", // Placeholder text
                            // ApiIntegration!.data[index].message,
                            maxLines: _isExpanded ? 6 : 3, // Show all text when expanded
                            overflow: TextOverflow.ellipsis,
                          ),

                          if (!_isExpanded)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                              child: Text(
                                "Read More",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          // If expanded, show "Read Less"
                          if (_isExpanded)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                              child: Text(
                                "Read Less",
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
}

// Method to show the popup menu (unchanged)
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
  );
}
