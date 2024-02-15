import 'package:flutter/material.dart';

class SearchInputField extends TextField {
  SearchInputField({Key? key,})
      : super(
    key: key,
    decoration: InputDecoration(

      prefixIcon: Icon(Icons.search,color: Colors.grey.shade700,),
      suffixIcon: Icon(Icons.mic,color: Colors.grey.shade700,),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(width: 2.0, color: Colors.grey.shade300),
      ),
    ),
  );
}