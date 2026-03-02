import 'package:eduzone/features/auth/persentation/screen/widgets/SocialButton.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/custom_button.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/custom_text.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/top_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          child: Column(
            children: [
              TopLogoWidget(text: 'Login'),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    CustomText(text: 'Email'),
                    SizedBox(height: 15),
                    CustomTextfield(),
                    SizedBox(height: 10),
                    CustomText(text: 'Password'),
                    SizedBox(height: 15),
                    CustomTextfield(),
                    Align(
                      alignment: .bottomRight,
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomButton(text: 'Login'),
                      ),
                    ),
                    SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "or continue with",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          icon: FontAwesomeIcons.google,
                          iconColor: const Color(0xFFDB4437),
                          onTap: () => print("Google Login"),
                        ),
                        const SizedBox(width: 30),

                        SocialButton(
                          icon: FontAwesomeIcons.facebook,
                          iconColor: const Color(0xFF4267B2),
                          onTap: () => print("Facebook Login"),
                        ),
                        const SizedBox(width: 30),

                        SocialButton(
                          icon: FontAwesomeIcons.apple,
                          iconColor: Colors.black,
                          onTap: () => print("Apple Login"),
                        ),
                      ],
                    ),
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
