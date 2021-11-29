import 'dart:io';

import 'package:http/http.dart' as http;

import 'dart:async';

class Api_call {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _response(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception("No data Available");
    }
    switch (response.statusCode) {
      case 445:
      case 200:

        // var responseJson = json.decode(response.body.toString());
        return response.body;
      case 400:
        throw Exception(response.body.toString());
      case 401:

      case 403:
        throw Exception(response.body.toString());
      case 500:

      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
