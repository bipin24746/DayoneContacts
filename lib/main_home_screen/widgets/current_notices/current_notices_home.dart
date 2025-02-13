import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/presentation/screens/all_notices_clean.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/api_data/api_data.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/api_data/api_services.dart';
import 'package:flutter/material.dart';

class CurrentNoticesHome extends StatefulWidget {
  const CurrentNoticesHome({super.key});

  @override
  State<CurrentNoticesHome> createState() => _CurrentNoticesHomeState();
}

class _CurrentNoticesHomeState extends State<CurrentNoticesHome> {
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
    return Container(
      height: 275,
      color: Colors.orangeAccent.withOpacity(0.1),
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
                      "Current Notices",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllNoticesClean()));
                  },
                  child: Row(
                    children: [
                      Text(
                        "View all",
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Visibility(
                visible: isLoaded,
                child: ListView.builder(
                  itemCount: ApiIntegration?.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Text("Nov 16, 2023"),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Text("12:15 AM"),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.orangeAccent.withOpacity(0.3),
                                ),
                                Text(
                                  ApiIntegration!.data[index].message,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
