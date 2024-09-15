import 'package:flutter/material.dart';
import 'package:listo_to_do_list_app/constants/colors.dart';

class AddToDoBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAddPressed;

  const AddToDoBar({
    Key? key,
    required this.controller,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                cursorColor: kSecondaryBlue,
                style: const TextStyle(
                  color: kSecondaryBlue,
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  hintText: 'Add a new todo item.',
                  hintStyle: TextStyle(color: kMainBlue),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, right: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kMainBlue,
                elevation: 10,
                minimumSize: const Size(60, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: onAddPressed,
              child: const Text(
                "+",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
