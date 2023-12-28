import 'package:cursos/pages/sign_in/widgets/sign_in/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(
                context,
              ),
              resuableText("or use your email account login"),
              Container(
                margin: EdgeInsets.only(top: 66.h),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    resuableText("Email"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
