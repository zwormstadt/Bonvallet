import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Elastic {
  final String indexName = 'test_coaches_2';
  Future<bool> insertDocument(Map<String, dynamic> document) async {
    var status = false;
    final Map<String, String> headers = {
      "Content-Type": "application/json"
    };
    final String url = 'http://10.143.12.199:9200/' + indexName + '/_doc/';
    var response = await http.post(url, headers: headers, body: convert.jsonEncode(document));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Insert document request succeeded with status code 200 or 201");
      status = true;
    } else {
      print('Insert document request failed with status: ${response.statusCode}.');
      status = false;
    }
    return status;
  }
}

