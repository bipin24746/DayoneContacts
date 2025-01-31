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

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notices.data.length,
      itemBuilder: (context, index) {
        final notice = notices.data[index];
        debugPrint("Notice: ${notice.title} - ${notice.message}");
        return ListTile(
          title: Text(notice.title),
          subtitle: Text(notice.message),
        );
      },
    );
  }
}
