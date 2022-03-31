import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/repository/ecommerce_repository.dart';

class EcommerceProvider with ChangeNotifier{
  bool? _isUserExist = false;
  //CategoryModel? _categoryModel;

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


  // Future<void> foodCategory()async{
  //   Response response = await EcommerceRepository().foodCategory();
  //   if(response.statusCode == 200){
  //     _categoryModel = CategoryModel.fromJson(response.data);
  //   }
  //   else{
  //     print("Not found");
  //   }
  // }





  bool get isUserExist => _isUserExist!;
  set isUserExist(bool value) {
    _isUserExist = value;
    notifyListeners();
  }

  //CategoryModel get categoryModel => _categoryModel!;
}