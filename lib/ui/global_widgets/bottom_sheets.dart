import 'package:flutter/material.dart';

class CustomBottomSheets {
  static void showSimpleModelBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        // Using Wrap makes the bottom sheet height the height of the content.
        // Otherwise, the height will be half the height of the screen.
        return Wrap(
          children: const [
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('Get link'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit name'),
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete collection'),
            ),
          ],
        );
      },
    );
  }
}
