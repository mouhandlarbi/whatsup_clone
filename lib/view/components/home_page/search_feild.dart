import 'package:flutter/material.dart';

class SearchFeild extends StatelessWidget {
  const SearchFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: "Search for Services",
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            suffixIconColor: Colors.black),
      ),
    );
  }
}
