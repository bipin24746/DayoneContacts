import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/integration.dart';
import '../bloc/notice_bloc.dart';

class CurrentNoticeHome extends StatelessWidget {
  const CurrentNoticeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoticeBloc, NoticeState>(
      builder: (context, state) {
        if (state is NoticeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NoticeLoaded) {
          debugPrint("Notices received: ${state.notices.data.length}");
          return _buildNoticesList(state.notices);
        } else if (state is NoticeError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No notices available'));
        }
      },
    );
  }

  Widget _buildNoticesList(Integration notices) {
    if (notices.data == null || notices.data.isEmpty) {
      debugPrint("No notices found!");
      return const Center(child: Text('No notices available'));
    }

    return Container(
      height: 550,
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
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
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
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notices.data.length,
                itemBuilder: (context, index) {
                  final notice = notices.data[index];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
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
                                notice.category,
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
                                notice.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
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
                                notice.message,
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
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
