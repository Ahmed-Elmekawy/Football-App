import 'dart:convert';

import 'package:http/http.dart' as http;
class HttpHelper{
  static String str="";
  static dynamic data;
  static var headers = {
    'x-rapidapi-key': '91aa7e026c21f4e598997b4bc27edd1b',
    'x-rapidapi-host': 'v3.football.api-sports.io'
  };
  static getData(String url)async{
    var request = http.Request('GET', Uri.parse(url));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    str=await response.stream.bytesToString();
    return data=jsonDecode(str);
  }
}