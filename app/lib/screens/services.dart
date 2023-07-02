import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class NetworkHelper {
  Future<dynamic> getData(File imageFile) async{
    var uri = Uri.parse('https://a0ad-165-225-106-129.ngrok-free.app/predict?query=$imageFile.jpg');
    print(uri);
    final response = await http.get(uri);

   print(response.statusCode);
   if(response.statusCode == 200)
   {
    String data = response.body;
    var decodedData = jsonDecode(data);
    print(decodedData['class_with_highest_probability']);
    return decodedData;
   }
  }
}