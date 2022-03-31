import 'package:flutter/material.dart';
import 'package:flutter_test_app/validation/phoneNo_validation.dart';


class PhoneNoField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? phoneNoController;
  final String? validText;





  PhoneNoField({@required this.hintText, @required this.phoneNoController, @required this.validText,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width:300,
      child: TextFormField(
          controller: phoneNoController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            hintText: hintText,
            hintStyle: TextStyle(
            ),
            errorStyle: const TextStyle(fontSize: 11, height: 0.3),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: .5,
                color: Colors.red,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),

            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          validator: (value) {
            if(value == " " || value == null || numberValidation(phoneNoController!.text) == true){
            return validText;
            }
            else{
            return null;
            }
          }
      ),

    );
  }
}