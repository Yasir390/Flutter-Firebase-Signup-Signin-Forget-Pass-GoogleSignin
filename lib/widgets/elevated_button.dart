import 'package:flutter/material.dart';

Widget ReusableButton({
 required BuildContext context,
  required void Function()? onPressed,
  required String buttonText,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height*0.08,
    width: MediaQuery.of(context).size.width*0.9,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide.none,
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white,fontSize: 22), // Set the text color
      ),
    ),
  );
}
