import 'package:flutter/material.dart';
import 'package:flutter_firebase_rsfg/screens/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = 'homepage';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, SignupScreen.route, (route) => false);
            }, icon: Icon(Icons.logout,color: Colors.blue[900],))
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text('Welcome 😉',style: TextStyle(fontSize: 25),))
          ],
        ),
      ),
    );
  }
}
