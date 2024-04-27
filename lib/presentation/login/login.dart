import 'package:coupple_app/core/const.dart';
import 'package:coupple_app/core/widget/button/sign_in_button.dart';
import 'package:coupple_app/core/widget/couple_body.dart';
import 'package:coupple_app/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoupleBody(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 0),
            child: Center(
              child: Text(
                'Couple.',
                style: GoogleFonts.bebasNeue(fontSize: 50, color: primaryColor),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()));
                  },
                  child: const Text('Love Begin')),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 0, horizontal: horizontalPadding),
            child: Row(
              children: [
                const Expanded(
                    child: Divider(
                  endIndent: 10,
                )),
                Text(
                  'OR CONTINUE WITH',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Expanded(
                    child: Divider(
                  indent: 10,
                )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding, horizontal: horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  button: Button.apple,
                  onPressed: () {},
                ),
                SignInButton(
                  button: Button.google,
                  onPressed: () {},
                ),
                SignInButton(
                  button: Button.facebook,
                  onPressed: () {},
                )
              ],
            ),
          ),
          //SignInButtonBuilder(backgroundColor: backgroundColor, onPressed: onPressed, text: text)
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding, horizontal: horizontalPadding),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'By registering you agree to our '),
                    TextSpan(
                        text: "Terms of Use",
                        style: TextStyle(color: Colors.blue)),
                    TextSpan(text: " and "),
                    TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(color: Colors.blue))
                  ]),
            ),
          ),
        ],
      )),
    );
  }
}
