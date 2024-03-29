import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  dynamic url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body;
      // print(data);
      var decodedData = jsonDecode(data);
      return decodedData;

    } else {
      // ignore: avoid_print
      print(response.statusCode);
    }
  }
}