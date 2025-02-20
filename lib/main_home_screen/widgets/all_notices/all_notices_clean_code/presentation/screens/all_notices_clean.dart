import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/di/injection.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/data/data_source/all_notices_remote_datasource.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/data/repositories/all_notices_repository_implementation.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/entities/all_notice_integration.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/usecase/get_all_notices_usecases.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/presentation/bloc/all_notices_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class AllNoticesClean extends StatefulWidget {
  const AllNoticesClean({super.key});

  @override
  State<AllNoticesClean> createState() => _AllNoticesCleanState();
}

class _AllNoticesCleanState extends State<AllNoticesClean> {
  String sortingOrder = 'latest'; // Default sorting order
  List<bool> expandedStates = []; // To track the expanded state of each notice

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => sl<AllNoticeBloc>()..add(FetchAllNotices()),
    // return BlocProvider(
    //   create: (context) => AllNoticeBloc(
    //     getAllNotices: GetAllNoticesUsecase(
    //       AllNoticesRepositoryImplementation(
    //         AllNoticeRemoteDataSource(
    //           Dio(),
    //         ),
    //       ),
    //     ),
    //   )..add(FetchAllNotices()),
      child: BlocBuilder<AllNoticeBloc, AllNoticeState>(
        builder: (context, state) {
          if (state is AllNoticeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AllNoticeLoaded) {
            debugPrint("Notices received: ${state.allNoticesCleans.data.length}");
            return _buildAllNoticesList(state.allNoticesCleans, context);
          } else if (state is AllNoticeError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No notices available'));
          }
        },
      ),
    );
  }

  Widget _buildAllNoticesList(
      AllNoticesIntegration allNotices, BuildContext context) {
    if (allNotices.data == null || allNotices.data.isEmpty) {
      debugPrint("No notices");
      return const Center(child: Text("There are no notices"));
    }

    // Sort notices based on the selected sorting order (latest or oldest)
    if (sortingOrder == 'latest') {
      allNotices.data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } else {
      allNotices.data.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }

    // Initialize the expandedStates list to match the number of notices
    if (expandedStates.length != allNotices.data.length) {
      expandedStates = List<bool>.filled(allNotices.data.length, false);
    }

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
      body: ListView.builder(
        itemCount: allNotices.data.length,
        itemBuilder: (context, index) {
          final allnotice = allNotices.data[index];
          // Format the createdAt field using the DateFormat class
          String formattedDate = DateFormat('MMM dd, yyyy').format(allnotice.createdAt);
          String formattedTime = DateFormat('hh:mm a').format(allnotice.createdAt);

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                          allnotice.category,
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
                          allnotice.title,
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
                        // Show the message text and conditionally display more or less
                        Text(
                          allnotice.message,
                          maxLines: expandedStates[index] ? null : 3,
                          overflow: expandedStates[index]
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              expandedStates[index] = !expandedStates[index]; // Toggle the expansion state
                            });
                          },
                          child: Text(
                            expandedStates[index] ? "Read Less" : "Read More",
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
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

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
          sortingOrder = 'latest'; // Set sorting to latest
        });
      } else if (value == 2) {
        setState(() {
          sortingOrder = 'oldest'; // Set sorting to oldest
        });
      }
    });
  }
}
