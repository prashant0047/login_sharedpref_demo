import 'package:flutter/material.dart';
import 'package:login_sharedpref_demo/login_page.dart';
import 'package:login_sharedpref_demo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home"),
        ),
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Icon(
            Icons.home,
            size: 150,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var prefs = await SharedPreferences.getInstance();
          prefs.setBool(SplashPageState.KEYLOGIN, false);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        },
        child: Icon(Icons.logout_outlined),
      ),
    );
  }
}
