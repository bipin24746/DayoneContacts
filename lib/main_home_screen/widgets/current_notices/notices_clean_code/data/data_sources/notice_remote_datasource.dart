import 'dart:convert';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../models/shared_prefs.dart';
import '../models/integration_models.dart';


abstract class NoticeRemoteDataSource{
  Future<IntegrationModel> getNotices();
}
@LazySingleton(as: NoticeRemoteDataSource)
class NoticeRemoteDataSourceimpl implements NoticeRemoteDataSource {
  final Dio dio;

  NoticeRemoteDataSourceimpl(this.dio);

  Future<IntegrationModel> getNotices() async {
    final token = await SharedPrefs.getAuthToken();
    if (token == null) throw Exception('Authentication token not found');

    try {
      final response = await dio.get(
        ApiConstants.noticeEndpoint,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        log("data from notices: ${response.data}");
        return IntegrationModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load notices');
      }
    } catch (e) {
      throw Exception('Failed to load notices: $e');
    }
  }
}
