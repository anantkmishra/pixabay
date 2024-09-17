import 'package:flutter/material.dart';
import 'package:pixabay/service/pixabay.dart';

import '../models/image_model.dart';

class PixabayImageProvider extends ChangeNotifier{
  List<PixabayImage>? _images;
  List<PixabayImage>? get images => _images;
  void _setImages(List<PixabayImage>? pi){
    _images = pi;
    notifyListeners();
  }

  String? _error;
  String? get error => _error;
  void _setError(String? e) {
    _error = e;
    notifyListeners();
  }

  String? _query;
  String? get query => _query;
  void setQuery(String? q){
    _query = q;
  }

  void getImages() async {
    _setError(null);
    _setImages(null);
    try{
      await fetchImages(query).then((imgs){
        _setImages(imgs);
      });
    }catch(e){
      _setError(e.toString());
    }
  }

}