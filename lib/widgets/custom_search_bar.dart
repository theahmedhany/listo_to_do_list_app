import 'package:flutter/material.dart';
import 'package:listo_to_do_list_app/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const CustomSearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => onSearch(value),
        cursorColor: kSecondaryBlue,
        style: const TextStyle(
          color: kSecondaryBlue,
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: kMainBlue,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: kMainBlue),
        ),
      ),
    );
  }
}
