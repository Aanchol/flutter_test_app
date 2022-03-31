import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/model/categories.dart';
import 'package:flutter_test_app/repository/ecommerce_repository.dart';

class EcommerceProvider with ChangeNotifier{
  bool? _isUserExist = false;
  Categories? _categories;
  bool? _isLoading = true;

  Future<bool> isUserLogin(String phoneNumber, String password)async{
    Response response = await EcommerceRepository().isUserLogin(phoneNumber, password);
    if(response.statusCode == 200){
      isUserExist = true;
    }
    else{
      isUserExist = false;
    }
    notifyListeners();
    return isUserExist;
  }


  Future<void> foodCategory()async{
    Response response = await EcommerceRepository().foodCategory();
    if(response.statusCode == 200){
      _categories = Categories.fromJson(response.data);
      _isLoading = true;
    }
    else{
      print("Not found");
      _isLoading = false;
    }
    notifyListeners();
  }





  bool get isUserExist => _isUserExist!;
  set isUserExist(bool value) {
    _isUserExist = value;
    notifyListeners();
  }


  Categories get categories => _categories!;

  bool get isLoading => _isLoading!;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}