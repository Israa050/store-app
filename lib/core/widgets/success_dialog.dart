
// Success Dialog
import 'package:flutter/material.dart';

Future<void> showSuccessDialog(BuildContext context, {String message = "Operation was successful", Icon? icon}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // Prevent dialog from closing when tapping outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 16,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              icon ?? Icon(Icons.check_circle, color: Colors.green, size: 60), // Default success icon
              SizedBox(height: 10),
              Text(
                message,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                child: Text("Close", style: TextStyle(fontSize: 16,color: Colors.white)),
              ),
            ],
          ),
        ),
      );
    },
  );
}