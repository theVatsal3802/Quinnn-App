import 'package:flutter/material.dart';

class DashBoardFunctions {
  static void showMoreOptionsForPostBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(
                  "Edit Post",
                  textScaleFactor: 1,
                ),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                iconColor: Colors.red,
                leading: const Icon(Icons.delete),
                title: const Text(
                  "Delete Post",
                  textScaleFactor: 1,
                ),
                textColor: Colors.red,
                onTap: () {},
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
