import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return AlertDialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        content: Text(
          '${value.commonTrans['confirmDialogContent']}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // return true
              Navigator.of(context).pop(true);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text('${value.commonTrans['confirmButton']}'),
            ),
          ),
          // const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              // return false
              Navigator.of(context).pop(false);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text('${value.commonTrans['cancelButton']}'),
            ),
          ),
        ],
      );
    });
  }

  static Future<bool?> show(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return ConfirmDialog();
        });
  }
}
