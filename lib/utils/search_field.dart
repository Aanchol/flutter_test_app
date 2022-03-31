import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchField extends StatelessWidget {
  final IconData? searchIcon;

  SearchField({@required this.searchIcon,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 12.0),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(searchIcon),
          suffixIcon: Icon(FontAwesomeIcons.bars),
          hintText: "Search items for",
          hintStyle:
          TextStyle(color: Colors.grey, fontSize: 15),),
      ),
    );
  }
}