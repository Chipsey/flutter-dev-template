import 'package:Xillica/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:Xillica/validators/validators.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Create a GlobalKey for the Form
  final _formKey = GlobalKey<FormState>();

  //////////////// Variables /////////////////
  String? _username;
  String? _password;

  //////////////// Methods ///////////////////
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with login
      _formKey.currentState!.save();
      print("Username: $_username, Password: $_password");
      NotificationService().showNotification(
          title: "Greetings, $_username.", body: "Login successful.");
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          "Xillica",
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                child: Text(
                  "Welcome to Xillica",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                duration: Duration(seconds: 1),
                tween: Tween<double>(begin: 1, end: 0),
                curve: Curves.easeOut,
                builder: (BuildContext context, double _value, Widget? child) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: _value * 20,
                    ),
                    child: child,
                  );
                },
              ),
              Text(
                "Login to your account",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) {
                        _username = value;
                      },
                      validator: Validators.validateUsername,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        labelText: 'Username',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _password = value;
                      },
                      validator: Validators.validatePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Forgot password?",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: _handleLogin,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Not signed up?",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
