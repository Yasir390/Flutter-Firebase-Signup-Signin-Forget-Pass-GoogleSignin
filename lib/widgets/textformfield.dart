import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  const ReusableTextFormField({
    super.key,
    required this.nameController,
    required this.obscureText,
    required this.hintText,
    required this.keyboardType,
    this.validator, required this.suffixIcon, this.onTap
  });

  final TextEditingController nameController;
  final bool obscureText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final  Widget suffixIcon;
 final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: TextFormField(

        onTap: onTap,
        autovalidateMode:AutovalidateMode.onUserInteraction,
          controller: nameController,
          obscureText: obscureText ,
          keyboardType: keyboardType,//
          decoration: InputDecoration(
            errorStyle: TextStyle(
              color: Colors.blue
            ),
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.all(20),
            hintText: hintText, //
            hintStyle: TextStyle(

            ),
            fillColor: Colors.grey[300],
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30)
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30)
            ),
            focusedBorder:OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30)
            ),
          ),

          validator:validator ,

      ),
    );
  }
}
