import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'api_data.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  Future<Integration?> getData() async {
    final accessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0ZGI1YTIwLWM2MmYtNDc2Yi05NzM5LWU0MWQ3ZjdjYTVkYyIsImN1cnJlbnRBcGFydG1lbnQiOiI5YjdmYTJjNS1jNzQ3LTQ2NWMtOTViZS0zZTVjNTllOTY3YzMiLCJjdXJyZW50RmxhdCI6IjQxYjU5ZjkwLTg5ZDctNDk2NS04MWI1LTZmMTdmZWU2NmMyNiIsImlhdCI6MTczNzQzMzY0MywiZXhwIjoxNzM3NDM1NDQzfQ.dblN_sv9G3b8jd5YbyKdiOwVX1dXtJp2BXad3AVU2-8';
    var uri = 'https://housing-stagingserver.aitc.ai/api/v1/client/notice' ;
    final prefs = await SharedPreferences.getInstance();

    //retrive the access token from sharedpreferences
    final authtoken = prefs.getString('authToken');
    print('auth token in homescreen:$authtoken');

    //make the GET request with the authorization header
    var response = await http.get(Uri.parse(uri),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $authtoken',  // Attach the token to the request header
      }, );


    log('response from the server:${response.body}');

    if (response.statusCode == 200) {
      // Parse the response data as a Map<String, dynamic>
      final Map<String, dynamic> responseData = convert.json.decode(response.body);

      // Now return the data by using the Integration.fromJson method
      return Integration.fromJson(responseData);
    } else {
      throw Exception('Failed to load integrations');
    }


  }
}
