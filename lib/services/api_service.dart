import 'dart:convert';
import 'package:http/http.dart' as http;

Future getNames() async {
  Uri url = Uri.parse(
      'https://3a178515-5a1f-4da4-b47b-b9e825f92625.mock.pstmn.io/getExam/');
  final response = await http.get(url);
  // print(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Unable to load data');
  }
}
