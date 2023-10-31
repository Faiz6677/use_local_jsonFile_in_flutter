import 'package:first_project/utils/my_routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isChange = false;

  moveToHome(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isChange = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/pic1.png'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black12),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'UserName ',
                            hintText: 'inter your user id or username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                        keyboardType: TextInputType.emailAddress,
                        controller: userNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please inter your username of password';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'inter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                        keyboardType: TextInputType.name,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please inter password';
                          }
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.deepPurple,
                        ),
                        width: isChange ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        duration: Duration(seconds: 1),
                        child: isChange
                            ? Icon(Icons.done)
                            : Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
