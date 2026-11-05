import 'package:flutter/material.dart';
import 'package:logreg/registration_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 153, 209),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),

          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),

            child: Padding(
              padding: EdgeInsets.all(25),

              child: Form(
                key: _formKey,

                child: Column(
                  children: [
                    Icon(Icons.account_circle, size: 80, color: Colors.indigo),
                    SizedBox(height: 15),
                    Text(
                      "Hello Sir/Ma'am",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(
                      'Login to your account',
                      style: TextStyle(color: Colors.grey),
                    ),

                    SizedBox(height: 30),

                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        String pattern = r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$';

                        if (!RegExp(pattern).hasMatch(value)) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 30),

                    // Password Field
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }

                        String pattern =
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$';

                        if (!RegExp(pattern).hasMatch(value)) {
                          return 'Use 8+ characters with uppercase, lowercase and number';
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login button clicked')),
                            );
                          }
                        },
                        child: Text('LOGIN', style: TextStyle(fontSize: 16)),
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont you have an account?'),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
                              ),
                            );
                          },
                          child: Text('Register'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
