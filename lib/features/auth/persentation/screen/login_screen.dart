import 'package:eduzone/core/functions.dart';
import 'package:eduzone/features/auth/data/repo/auth_repo/auth_repo.dart';
import 'package:eduzone/features/auth/persentation/screen/signup_screen.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/SocialButton.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/custom_button.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/custom_text.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/top_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
import '../cubit/auth_cubit/auth_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginformkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            snackBarMessage(context: context, text: state.error);
          }
          if (state is LoginSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 0,
                  ),
                  child: Form(
                    key: loginformkey,
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
                              CustomTextfield(
                                prefixIcon: Icon(Icons.email_outlined),
                                controller: emailController,
                                hintText: "enter your email",
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "enter your email pls";
                                  }
                                  if (val.contains("@")) {
                                    return "write correct email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10),
                              CustomText(text: 'Password'),
                              SizedBox(height: 15),
                              CustomTextfield(
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "enter your password pls";
                                  }
                                  if (val.length > 6) {
                                    return "write valid password more than 6 chart";
                                  }
                                  return null;
                                },
                                prefixIcon: Icon(Icons.password_outlined),
                                controller: passwordController,
                                hintText: "enter your password",
                              ),
                              Align(
                                alignment: .bottomRight,
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                              state is LoginLoadingState
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: CustomButton(
                                          onPressed: () {
                                            if (loginformkey.currentState!
                                                .validate())
                                              ;
                                            context.read<AuthCubit>().signin(
                                              password: passwordController.text
                                                  .trim(),
                                              email: emailController.text
                                                  .trim(),
                                            );
                                          },
                                          text: 'Login',
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 30),

                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 35,
                                  left: 35,
                                ),
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
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
