import 'package:flutter/material.dart';
import 'package:node_bb_application/presentation/screens/auth/login_page.dart';

import '../category_list.dart';

class SignUpPage extends StatelessWidget {
  static const id = 'Sign Up Page';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userEditor = TextEditingController();
  final TextEditingController emailEditor = TextEditingController();
  final TextEditingController passEditor = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment:
              MediaQuery.of(context).viewInsets.bottom != 0 ? MainAxisAlignment.center : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TODO 4: change the logo to app logo
                      Image.asset(
                        'assets/images/nitk_logo.png',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(width: 20),
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        width: 2.5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xffdfdfde),
                          border: Border.fromBorderSide(
                            BorderSide(color: Color(0xffbcb5b5), width: 2.5),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        // TODO 5: change the IRIS to other tag line
                        "IRIS",
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 50, fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text('SignUp'),
                const SizedBox(height: 10),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: emailEditor,
                decoration: InputDecoration(
                  // icon: Icon(icon),
                  border: const OutlineInputBorder().copyWith(
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Color(0xffdfdfde),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder().copyWith(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  labelText: 'email',
                  labelStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: userEditor,
                decoration: InputDecoration(
                  // icon: Icon(icon),
                  border: const OutlineInputBorder().copyWith(
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Color(0xffdfdfde),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder().copyWith(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  labelText: 'username',
                  labelStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passEditor,
                decoration: InputDecoration(
                  // icon: Icon(icon),
                  border: const OutlineInputBorder().copyWith(
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Color(0xffdfdfde),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder().copyWith(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 2.5,
                      bottom: 2.5,
                      left: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            width: 1.5,
                            color: Theme.of(context).primaryColor,
                          )),
                      onPressed: () async {
                        Navigator.pushNamed(context, CategoryList.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(height: 5),
            const SizedBox(height: 5),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        style: const ButtonStyle(),
                        child: Text(
                          'Already a user? Password',
                          style: TextStyle(decoration: TextDecoration.underline, color: Theme.of(context).primaryColor),
                        ),
                      ),
                      // TODO 4
                      // Stack(
                      //   alignment: AlignmentDirectional.center,
                      //   children: [
                      //     Container(
                      //       width: 40,
                      //       height: 2,
                      //       decoration: const BoxDecoration(
                      //           border: Border.fromBorderSide(BorderSide(
                      //         width: 1,
                      //       ))),
                      //     ),
                      //     const Padding(
                      //       padding: EdgeInsets.only(left: 10, right: 10),
                      //       child: Text(
                      //         'OR',
                      //         style: TextStyle(backgroundColor: Colors.white),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // TODO 3: remove the comments from block listener attached to login using google
                      // BlocListener<AuthBloc, AuthState>(
                      //   listener: (context,state){
                      //     if(state is GoogleAuthenticationComplete){
                      //       Navigator.pushNamed()
                      //     }
                      //   },
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      //     onPressed: () {
                      //       BlocProvider.of<AuthBloc>(context).add(GoogleAuthenticationEvent());
                      //     },
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset(
                      //           'assets/images/google_logo.png',
                      //           height: 25,
                      //           width: 25,
                      //         ),
                      //         const SizedBox(width: 10),
                      //         const Text(
                      //           'Sign In with Google',
                      //           style: TextStyle(color: Colors.black),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  )
                : const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
