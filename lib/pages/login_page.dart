import 'package:flutter/material.dart';
import 'package:flutter_test_app/pages/home_page.dart';
import 'package:flutter_test_app/provider/ecommerce_provider.dart';
import 'package:flutter_test_app/utils/custom_toast.dart';
import 'package:flutter_test_app/utils/password_field.dart';
import 'package:flutter_test_app/utils/phoneNo_field.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? phoneNoController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<EcommerceProvider>(
      builder: (_,provider,___) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,

            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  PhoneNoField(
                    hintText: "Enter Your Phone Number",
                    phoneNoController: phoneNoController,
                    validText: "Enter a valid phone number please",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PasswordField(
                    hintText: "Enter Your Password",
                    passwordController: passwordController,
                    validText: "Enter your correct password",
                  ),
                  ElevatedButton(
                    onPressed: ()async{
                      if(formKey.currentState!.validate())
                      {
                        await provider.isUserLogin(phoneNoController!.text,passwordController!.text);
                        if(provider.isUserExist == false){
                          CustomToast.toastShower("Login Failed", Colors.red);
                        }
                        else{
                          CustomToast.toastShower("Successfully Login", Colors.blue);
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return HomePage();
                          }),
                          );
                        }
                      }else{
                        CustomToast.toastShower("Email or Password is invalid", Colors.red);
                      }
                    },


                    child: Container(
                      height: 50,
                      width: 150,
                      padding: const EdgeInsets.only(top: 11),
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
