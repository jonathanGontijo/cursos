import 'package:cursos/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:cursos/pages/sign_in/bloc/sign_in_events.dart';
import 'package:cursos/pages/sign_in/bloc/sign_in_states.dart';
import 'package:cursos/pages/sign_in/sign_in_controller.dart';
import 'package:cursos/pages/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Login"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(child: reusableText("Ou use sua conta de email")),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField("Entre com seu email", "email", "user",
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Entre com sua senha", "password", "lock", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        })
                      ],
                    ),
                  ),
                  forgotPassword(),
                  buildLogInAndRegButton("Log In", "login", () {
                    SignInController(context: context).handleSignIn('email');
                    print("login button");
                  }),
                  buildLogInAndRegButton("Sign Up", "register", () {
                    Navigator.of(context).pushNamed("register");
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
