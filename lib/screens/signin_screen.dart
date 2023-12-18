import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_rsfg/google_sign_in.dart';
import 'package:flutter_firebase_rsfg/screens/forgot_pass_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/elevated_button.dart';
import '../widgets/textformfield.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String route = 'signinscreen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showSpinner = false;
  final formKey = GlobalKey<FormState>();

  signIn() async {
    setState(() {
      showSpinner = true;
    });

    if (passwordController.text != null && emailController.text != '') {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration Successfull! 😍'),
          duration: Duration(seconds: 2),
        ));

        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.route, (route) => false);

        clearController();
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${e.code} 😥'),
          duration: Duration(seconds: 3),
        ));
      }
    }
    setState(() {
      showSpinner = false;
    });
  }

  clearController() {
    passwordController.clear();
    emailController.clear();
  }

  bool hasPasswordInvisible = true;
  String img = 'car';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: SafeArea(
              child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  child: Image.asset('images/$img.png'),
                ),
                ReusableTextFormField(
                    nameController: emailController,
                    obscureText: false,
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Write Email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
                          .hasMatch(value)) {
                        return 'Please Write Valid Email';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.mail),
                    onTap: () {
                      setState(() {
                        img = 'car';
                      });
                    }),
                ReusableTextFormField(
                    nameController: passwordController,
                    obscureText: hasPasswordInvisible ? true : false,
                    hintText: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Write Password';
                      }
                      if (value.length < 6) {
                        return 'Password at least 6 character';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hasPasswordInvisible = !hasPasswordInvisible;
                            if(hasPasswordInvisible == true){
                              img = 'eyes-off-monkey';
                            }
                            else{
                              img = 'monkey';
                            }
                          });
                        },
                        icon: hasPasswordInvisible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye)),
                    onTap: () {
                      setState(() {
                        if(hasPasswordInvisible == true){
                          img = 'eyes-off-monkey';
                        }
                        else{
                          img = 'monkey';
                        }
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                    context: context,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        signIn();
                      }
                    },
                    buttonText: 'Sign In'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ForgotPasswordScreen.route);
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Or Login with',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    AuthMethods().signInWithGoogle(context);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    child: Image.asset('images/google.png',fit: BoxFit.cover,),
                  ),

                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
