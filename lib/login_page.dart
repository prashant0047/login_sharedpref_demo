import 'package:flutter/material.dart';
import 'package:login_sharedpref_demo/home_page.dart';
import 'package:login_sharedpref_demo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShowPassword1 = true;
  bool isShowPassword2 = true;
  dynamic t1;
  dynamic t2;

  final FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Login"),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: FormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.account_circle,
                  size: 200,
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Plese Enter Password";
                    }else if(value.length < 8){
                      return "very small password";
                    }else{
                      return null;
                    }
                  },

                  obscureText: isShowPassword1,
                  onChanged: (value) {
                    t1 = value.toString();
                  },
                  decoration: InputDecoration(
                      label: const Text("Password"),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          isShowPassword1 = !isShowPassword1;
                        });
                      }, icon: Icon(isShowPassword1 ? Icons.visibility_off : Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Plese Enter Password";
                    }else if(value.length < 8){
                      return "very small password";
                    }else{
                      return null;
                    }
                  },

                  obscureText: isShowPassword2,
                  onChanged: (value) {
                    t2 = value.toString();
                  },
                  minLines: 1,

                  decoration: InputDecoration(
                      label: const Text("Confirm Password"),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          isShowPassword2 = !isShowPassword2;
                        });
                      }, icon: Icon(isShowPassword2 ? Icons.visibility_off : Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),

                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if(FormKey.currentState!.validate()){
                      print("validate");
                      if(t1!=null && t2!=null){
                        if (t1 == t2) {
                          var sharedPref = await SharedPreferences.getInstance();
                          sharedPref.setBool(SplashPageState.KEYLOGIN, true);

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        }
                      }
                    }
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }

}
