import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_rsfg/screens/signup_screen.dart';
import 'package:flutter_firebase_rsfg/widgets/style.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const String route = 'forgotPasswordScreen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password Reset Email ha been sent!'),
        duration: Duration(seconds: 2),));
    }on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.code),
        duration: Duration(seconds: 2),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                'Password Recovery',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Enter your Email',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  cursorColor: Colors.grey,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: kTextFormFieldInputDecoration.copyWith(
                      hintText: 'Enter your mail',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Write Email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}').hasMatch(value)) {
                      return 'Please Write Valid Email';
                    }
                    else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                     if(_formKey.currentState!.validate()){
                       setState(() {
                         resetPassword();
                       });
                     }
                    },
                    child: Text(
                      'Send Email',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        )),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context,SignupScreen.route);
                    },
                    child: Text('Create',style: TextStyle(fontSize: 18,color: Colors.grey),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
