import 'package:exam2game/views/LoginPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
// Current selected value for the dropdown
  String? _selectedValue;
// The list of roles for the first dropdown
  final List<String> _roles = ['Teacher', 'Student'];

  // The map that associates roles with a list of skills
  final Map<String, List<String>> _roleSkills = {
    'Teacher': ['Under-Graduate', 'Graduate', 'Post-Graduate'],
    'Student': [
      'Class I',
      'Class II',
      'Class III',
      'Class IV',
      'Class V',
      'Class VI',
      'Class VII',
      'Class VIII',
      'Class IX',
      'Class X',
      'Class XI',
      'Class XII',
      'Other'
    ]
  };

  String? _selectedRole;
  String? _selectedQualification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Text("Sign Up",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // Bold text
                        fontSize: 40, // Font size
                        color: Colors.black, // Text color (for fallback)
                      ))
                ],
              ),
              Text("To create your account, please complete the form below",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal, // Bold text
                    fontSize: 18, // Font size
                    color: Colors.black, // Text color (for fallback)
                  )),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  "Already have an account? "), // Regular text
                          TextSpan(
                            text:
                                'Login', // The clickable part with a different color
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
                                print('Login clicked!');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                          )
                        ]),
                  ),
                ],
              ),
              SizedBox(height: 40),
              // Email TextField
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
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
              // Email TextField
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Adress',
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
              // Email TextField
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
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

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue,
                      width: 2), // Border around the dropdown
                  borderRadius: BorderRadius.circular(
                      8), // Rounded corners for the border
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedValue,
                  decoration: InputDecoration(
                    labelText: 'Select a Role',
                    border: InputBorder.none, // Remove the default border
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRole = newValue;
                      // Update qualifications based on selected role
                      _selectedQualification =
                          null; // Reset skill when role changes
                    });
                  },
                  items: _roles.map<DropdownMenuItem<String>>((String role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a Role';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue,
                      width: 2), // Border around the dropdown
                  borderRadius: BorderRadius.circular(
                      8), // Rounded corners for the border
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedQualification,
                  decoration: InputDecoration(
                    labelText: 'Select Qualification',
                    border: InputBorder.none, // Remove the default border
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedQualification = newValue;
                    });
                  },
                  items: _roleSkills[_selectedRole]
                      ?.map<DropdownMenuItem<String>>((String qualifications) {
                    return DropdownMenuItem<String>(
                      value: qualifications,
                      child: Text(qualifications),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a Qualification';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              // Password TextField
              TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder())),
              const SizedBox(height: 16.0),
              // Confirm Password TextField
              TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder())),
              const SizedBox(height: 50.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  "By signing up, you agree to our "), // Regular text
                          TextSpan(
                            text:
                                'Terms, Data Policy ', // The clickable part with a different color
                            style: TextStyle(
                              color:
                                  Colors.red, // Set the color of "Sign up" text
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
                          ),
                          TextSpan(text: " and "),
                          TextSpan(
                            text:
                                'Cookies Policy', // The clickable part with a different color
                            style: TextStyle(
                              color:
                                  Colors.red, // Set the color of "Sign up" text
                              fontWeight: FontWeight
                                  .bold, // Optional: make the text bold
                              decoration: TextDecoration
                                  .underline, // Optional: underline
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Sign up clicked!');
                                
                              },
                          )
                        ]),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(5, 5)),
                          )),
                      child: Text(
                        'Sign Up',
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
            ])),
      ),
    ));
  }
}
