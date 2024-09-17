import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixabay/models/image_model.dart';

Future<List<PixabayImage>> fetchImages(String? q) async {
  if (q!= null){
    q = "&q=$q";
  }
  List<PixabayImage> images = <PixabayImage>[];
  final http.Response? response = await http.get(
    Uri.parse(
      "https://pixabay.com/api/?key=46004448-a2c50e568600f10495e6e9633${q??''}&image_type=photo&pretty=true",
    ),
  );
  
  if (response != null){
    final Map<String,dynamic> res = jsonDecode(response.body);
    if (res.containsKey('hits') && res['hits'] is List){
      for (Map<String,dynamic> img in res['hits']){
        images.add(PixabayImage.fromJOSN(img));
      }
    }
  }

  return images;
}