import 'package:flutter/material.dart';
import 'package:flutter_test_app/pages/login_page.dart';
import 'package:flutter_test_app/provider/ecommerce_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<EcommerceProvider>(
              create: (context) => EcommerceProvider(),
            ),
          ],
       child: TestApp(),
      ),
  );
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}