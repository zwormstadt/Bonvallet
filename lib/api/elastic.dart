import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Elastic {
  static insertDocument(Map<String, dynamic> document) async {
    final Map<String, String> headers = {
      "Content-Type": "application/json"
    };
    final String url = 'http://10.143.12.199:9200/test_coaches_2/_doc/';
    document = {
        "name": "Jin Hang Ng NUMBER 123",
        "job": "Slave",
        "skillset": [
            {
                "category": "Athletic",
                "skills": [
                    "Type on keyboard while the animals are sleeping"
                ]
            },
            {
                "category": "Marksmanship",
                "skills": [
                    "Shoot a shotgun",
                    "Shoot a Glock",
                    "Shoot a sniper rifle",
                    "Shoot a running target",
                    "Shoot a target shooting a running target",
                    "Shoot a running shooting target",
                    "Shoot jackfruit seeds into garbage bin using mouth"
                ]
            }
        ]
    };
    var response = await http.post(url, headers: headers, body: convert.jsonEncode(document));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Insert document request succeeded with status code 200 or 201");
    } else {
      print('Insert document request failed with status: ${response.statusCode}.');
    }
  }
}