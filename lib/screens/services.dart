import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper {

  Future<dynamic> getData(String textentered) async{
    var uri = Uri.http('api.api-ninjas.com', '/v1/nutrition', {'query' : textentered});
    print(uri);

    final response = await http.get(uri, headers: {
    'X-Api-Key': ''
  },);

   print(response.statusCode);
   if(response.statusCode == 200)
   {
    String data = response.body;
    var decodedData = jsonDecode(data);
    return decodedData;
   }
  }
}