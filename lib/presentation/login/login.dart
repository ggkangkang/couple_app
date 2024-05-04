import 'package:coupple_app/core/const.dart';
import 'package:coupple_app/core/widget/button/sign_in_button.dart';
import 'package:coupple_app/core/widget/couple_body.dart';
import 'package:coupple_app/core/widget/dialog/couple_alert_dialog.dart';
import 'package:coupple_app/core/widget/dialog/dialog_lib/dialog.dart';
import 'package:coupple_app/core/widget/dialog/dialog_lib/dialog_type.dart';
import 'package:coupple_app/core/widget/text_field/rounded_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<void> signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameTextController.text,
        password: passwordTextController.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      //Wrong email
      if (e.code == 'user-not-found') {
        showDialogMessage('Wrong email');
      }
      //Wrong password
      else if (e.code == 'wrong-password') {
        showDialogMessage('Wrong password');
      } else {
        QubitAlertDialog.show(
            context: context,
            type: QubitAlertDialogType.error,
            title: 'Invalid Credetial',
            text: 'Please fill in valid username and password.',
            showCancelButton: false,
            showConfirmButton: false,
            confirmButtonText: 'OK');
        //showDialogMessage('Invalid Credetial');
      }
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return authResult.user;
      }
    } catch (error) {
      print('Google Sign-In Error: $error');
      return null;
    }
  }

  void showDialogMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => CoupleAlertDialog(title: message));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoupleBody(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 0),
                child: Center(
                  child: Text(
                    'Couple.',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 50, color: primaryColor),
                  ),
                ),
              ),

              //username
              RoundedTextField(
                  controller: usernameTextController,
                  labelText: 'Username',
                  icon: Icons.person),
              //password
              RoundedTextField(
                  controller: passwordTextController,
                  labelText: 'Password',
                  icon: Icons.password),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        signUserIn();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const SplashScreen()));
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
                      onPressed: () async {
                        signUserIn();
                        // final user = await signInWithGoogle();
                        // if (user != null) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => HomeScreen()));
                        // }
                      },
                    ),
                    SignInButton(
                      button: Button.facebook,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              //SignInButtonBuilder(backgroundColor: backgroundColor, onPressed: onPressed, text: text)
              //const Spacer(),
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
          ),
        ),
      )),
    );
  }
}
