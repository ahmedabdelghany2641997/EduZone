import 'package:eduzone/features/auth/persentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:eduzone/features/auth/persentation/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/SocialButton.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/custom_button.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/custom_text.dart';
import 'package:eduzone/features/auth/persentation/screen/widgets/top_logo_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/functions.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../data/repo/auth_repo/auth_repo.dart';
import '../cubit/auth_cubit/auth_states.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController signupEmailController = TextEditingController();
    TextEditingController signupPasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    final GlobalKey<FormState> signupformkey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is SignupErrorState) {
            snackBarMessage(context: context, text: state.error);
          }
          if (state is SignupSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 0,
                  ),
                  child: Form(
                    key: signupformkey,
                    child: Column(
                      children: [
                        TopLogoWidget(text: 'SignUp'),
                  
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              CustomText(text: 'Email'),
                              CustomTextfield(
                                prefixIcon: Icon(Icons.email_outlined),
                                controller: signupEmailController,
                                hintText: "enter your email",
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "enter your email pls";
                                  }
                                  if (!val.contains("@")) {
                                    return "write correct email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              CustomText(text: 'Name'),
                              SizedBox(height: 15),
                              CustomTextfield(
                                prefixIcon: Icon(Icons.email_outlined),
                                controller: nameController,
                                hintText: "enter your name",
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "enter your name pls";
                                  }
                  
                                  return null;
                                },
                              ),
                              SizedBox(height: 10),
                              CustomText(text: 'Password'),
                              SizedBox(height: 15),
                              CustomTextfield(
                                prefixIcon: Icon(Icons.password_outlined),
                                hintText: "enter your password",
                                controller: signupPasswordController,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "enter your password pls";
                                  }
                                  if (val.length < 6) {
                                    return "write valid password more than 6 chart";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              state is SignupLoadingState
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: CustomButton(
                                          onPressed: () {
                                            if (signupformkey.currentState!
                                                .validate()) {
                                              context.read<AuthCubit>().signup(

                                                password: signupPasswordController.text
                                                    .trim(),
                                                email: signupEmailController.text
                                                    .trim(),
                                                name: nameController.text.trim(),
                                              );
                                            }

                                          },
                                          text: 'SignUp',
                                        ),
                                      ),
                                    ),
                              Row(
                                mainAxisAlignment: .center,
                                children: [
                                  Text("you already have an account?"),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return LoginScreen();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                  ),
                                ],
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
