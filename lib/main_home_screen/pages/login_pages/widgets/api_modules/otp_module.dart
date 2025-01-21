import 'package:dio/dio.dart';
class OtpApi{
  final Dio _dio = Dio();
  Future<void> verifyOtp(String otp) async{
    try{
      Response response = await _dio.post('https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify',
      data: {
        "otp" :otp
      }
      );

      if(response.statusCode == 200){

        return response.data;
      }
      else{
        throw Exception("not verified otp");
      }

    }on DioException catch (e){
      if(e.response != null){

      }
    }
  }
}