import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../Settings/App_Colors.dart';
import 'Cutomized_Widgets/login_page_textFields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> frmKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            //image
            child: Image.asset(fit: BoxFit.fill, "assets/images/study2.jpg"),
          ),

          Container(
            // gradient
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(1), Colors.transparent],
              ),
            ),
          ),

          BackdropFilter(
            // blur
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(color: Colors.black.withOpacity(0)),
          ),

          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: frmKey,
                    child: Column(
                      children: [
                        // Email
                        LoginPageTextfields(
                          hintText: "Email",
                          controller: emailcontroller,
                        ),

                        const SizedBox(height: 15),

                        // Password
                        LoginPageTextfields(
                          hintText: "Password",
                          isPassword: true,
                          controller: passcontroller,
                        ),

                        const SizedBox(height: 25),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if(frmKey.currentState!.validate()){
                                // TODO: Login logic
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.floatingBtnColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Forgot Password
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to Password Change

                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
