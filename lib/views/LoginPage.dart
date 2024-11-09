import 'package:exam2game/views/SignUpPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic here
      String email = _emailController.text;
      String password = _passwordController.text;

      // You can call Firebase or any API here to authenticate
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("Login",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // Bold text
                        fontSize: 40, // Font size
                        color: Colors.black, // Text color (for fallback)
                      ))
                ],
              ),
              SizedBox(height: 20),
              // Email TextField
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email or Username or Phoneno',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Password TextField
              TextFormField(
                controller: _passwordController,
                obscureText: _isPasswordObscured,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: _togglePasswordVisibility,
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password screen
                    },
                    child: const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: _login,
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(5, 5)),
                          )),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                  // Login Button
                ],
              ),
              const SizedBox(height: 16.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Don't have an account? "), // Regular text
                          TextSpan(
                            text:
                                'Sign up', // The clickable part with a different color
                            style: TextStyle(
                              color: Colors
                                  .blue, // Set the color of "Sign up" text
                              fontWeight: FontWeight
                                  .bold, // Optional: make the text bold
                              decoration: TextDecoration
                                  .underline, // Optional: underline
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Sign up clicked!');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage()),
                                );
                              },
                          )
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
