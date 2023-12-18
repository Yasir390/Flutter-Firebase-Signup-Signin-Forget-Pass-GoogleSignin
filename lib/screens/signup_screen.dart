import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_rsfg/screens/home_screen.dart';
import 'package:flutter_firebase_rsfg/screens/signin_screen.dart';
import 'package:flutter_firebase_rsfg/widgets/elevated_button.dart';
import '../widgets/textformfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatefulWidget {
  static const String route = '/';

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showSpinner = false;
  final formKey = GlobalKey<FormState>();


  registration() async {
    setState(() {
      showSpinner = true;
    });

    if (passwordController.text != null && nameController.text != '' &&
        emailController.text != '') {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration Successfull! 😍'),
          duration: Duration(seconds: 2),));

        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route, (route) => false);

        clearController();
      }
      on FirebaseAuthException catch (e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${e.code} 😥'),
          duration: Duration(seconds: 3),));
      }
    }
    setState(() {
      showSpinner = false;
    });

  }

clearController(){
  passwordController.clear();
  nameController.clear();
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
                      height: 300,
                      width: double.infinity,
                      child: Image.asset('images/$img.png'),
                    ),
                    ReusableTextFormField(
                      nameController: nameController,
                      obscureText: false,
                      hintText: 'Name',

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Write Name';
                        }
                        if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return 'Please Write Valid Name';
                        }
                        else {
                          return null;
                        }
                      }, keyboardType:TextInputType.name,
                      suffixIcon: Icon(Icons.text_fields),

                        onTap: (){
                          setState(() {
                            img='car';
                          });
                        }
                    ),
                    ReusableTextFormField(
                      nameController: emailController,
                      obscureText: false,
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Write Email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}').hasMatch(
                            value)) {
                          return 'Please Write Valid Email';
                        }
                        else {
                          return null;
                        }
                      }, keyboardType: TextInputType.emailAddress,
                      suffixIcon: Image.asset('images/gmail.png',),
                      onTap: (){
                        setState(() {
                          img='car';
                        });
                      },

                    ),
                    ReusableTextFormField(
                        nameController: passwordController,
                        obscureText:hasPasswordInvisible? true:false,
                        hintText: 'Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Write Password';
                          }
                          if (value.length < 6) {
                            return 'Password at least 6 character';
                          }
                          else {
                            return null;
                          }
                        },
                         keyboardType:TextInputType.visiblePassword,
                         suffixIcon: IconButton(onPressed: (){
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
                             icon:hasPasswordInvisible? Icon(Icons.visibility_off): Icon(Icons.remove_red_eye)
                         ),
                        onTap: (){
                          setState(() {
                            if(hasPasswordInvisible == true){
                              img = 'eyes-off-monkey';
                            }
                            else{
                              img = 'monkey';
                            }
                          });

                        },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReusableButton(
                        context: context,
                        onPressed: () {

                         if(formKey.currentState!.validate()){
                           registration();
                         }

                        },
                        buttonText: 'Sign Up'
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',style: TextStyle(
                          fontSize: 18,
                        ),),
                        TextButton(onPressed:(){
                          Navigator.pushNamed(context, SignInScreen.route);
                        }, child: Text('LogIn',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),))
                      ],
                    )

                  ],
                ),
              )),
        ),
      ),
    );
  }
}
