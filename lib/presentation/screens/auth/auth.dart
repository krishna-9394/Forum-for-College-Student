import 'package:flutter/material.dart';
import 'package:node_bb_application/presentation/widgets/TextFeild.dart';
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
                        "IRIS",
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 50, fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Sign In to your IRIS account'),
                const SizedBox(height: 10),
              ],
            ),
            CTextField(
              title: "Reg No/Email",
              icon: Icons.person,
              isPassword: false,
            ),
            const SizedBox(height: 10),
            CTextField(
              title: "Password",
              icon: Icons.security,
              isPassword: true,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(
                top: 2.5,
                bottom: 2.5,
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  // BlocProvider.of<AuthBloc>(context).add(LoadingAuthEvent());
                  // entering into the homeScreen
                  Navigator.pushNamed(context, HomePage.id);
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    "Sign In",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(),
                        child: Text(
                          'Recover Password',
                          style: TextStyle(decoration: TextDecoration.underline, color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: 40,
                            height: 2,
                            decoration: const BoxDecoration(
                                border: Border.fromBorderSide(BorderSide(
                              width: 1,
                            ))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'OR',
                              style: TextStyle(backgroundColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google_logo.png',
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Sign In with Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
