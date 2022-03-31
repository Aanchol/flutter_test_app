import 'package:flutter/material.dart';
import 'package:flutter_test_app/utils/search_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                FontAwesomeIcons.biking,
                size: MediaQuery.of(context).size.width / 10,
                color: Colors.deepOrange,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "eFood",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
              ),
              Icon(FontAwesomeIcons.bell,
               color: Colors.black,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Row(
            children: [
              Expanded(
                  child: SearchField(
                searchIcon: Icons.search,
              )),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.width/2,
            width: MediaQuery.of(context).size.width/1.1,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10, left:10),
                  child: Text("All Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width/6,
                ),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
