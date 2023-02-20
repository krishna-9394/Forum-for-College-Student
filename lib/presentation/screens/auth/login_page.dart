import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:node_bb_application/business_logics/auth/auth_bloc.dart';
import 'package:node_bb_application/presentation/screens/auth/signup_page.dart';
import 'package:toast/toast.dart';

import '../category_list.dart';

class LoginPage extends StatefulWidget {
  static const String id = "login page";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController regEditor = TextEditingController();
  final TextEditingController passEditor = TextEditingController();
  bool obscureText = true;

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void showToast(String message) {
    Toast.show(message,
        backgroundColor: Colors.grey, backgroundRadius: 20, duration: Toast.lengthShort, gravity: Toast.bottom);
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showToast("Successful login...");
          Navigator.pushNamed(context, CategoryList.id);
        }
      },
      builder: (context, state) {
        if (state is DataFillingState) {
          print("Fill the Data");
          return Scaffold(
            body: Form(
              key: widget._formKey,
              child: Column(
                mainAxisAlignment:
                MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom != 0 ? MainAxisAlignment.center : MainAxisAlignment.center,
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
                                  fontWeight: FontWeight.w100,
                                  fontSize: 50,
                                  fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Login', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: widget.regEditor,
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
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                        ),
                        labelText: 'Username/Email',
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: widget.passEditor,
                          obscureText: widget.obscureText,
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
                                color: Theme
                                    .of(context)
                                    .primaryColor,
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
                        Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                print("reached at this point to make changes");
                                setState(() {
                                  widget.obscureText = !(widget.obscureText);
                                });
                              },
                              icon:
                              widget.obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            )),
                      ],
                    ),
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            width: 1.5,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          )),
                      onPressed: () async {
                        String name = widget.regEditor.text.trim();
                        String password = widget.passEditor.text.trim();
                        if (name.compareTo("") == 0) {
                          showToast("username/email cant be empty");
                          return;
                        } else if (password.length < 8) {
                          showToast("password should consist of atleast 8 digits");
                          return;
                        }
                        BlocProvider.of<AuthBloc>(context).add(Login(name, password));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Theme
                              .of(context)
                              .primaryColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom == 0
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpPage.id);
                        },
                        style: const ButtonStyle(),
                        child: Text(
                          'Need an account? SignUp',
                          style: TextStyle(
                              decoration: TextDecoration.underline, color: Theme
                              .of(context)
                              .primaryColor),
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
        else if (state is UserNotFoundState) {
          showToast("user not found...");
          return const Scaffold(
            body: Center(
              child: Text("User not Found"),
            ),
          );
        }
        else if (state is LoggingInState) {
          // showToast("Loading...");
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is FailedToLoginState) {
          if (state.error == null) {
            return const Scaffold(
              body: Center(
                child: Text("some unknown error"),
              ),
            );
          }
          print(state.error.toString());
          return Scaffold(
            body: Center(
              child: Text(state.error.toString()),
            ),
          );
        } else {
          return Scaffold(
            body: Form(
              key: widget._formKey,
              child: Column(
                mainAxisAlignment:
                MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom != 0 ? MainAxisAlignment.center : MainAxisAlignment.center,
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
                                  fontWeight: FontWeight.w100,
                                  fontSize: 50,
                                  fontFamily: 'CormorantGaramond-LightItalic.ttf'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Login', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: widget.regEditor,
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
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                        ),
                        labelText: 'Username/Email',
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: widget.passEditor,
                          obscureText: widget.obscureText,
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
                                color: Theme
                                    .of(context)
                                    .primaryColor,
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
                        Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                print("reached at this point to make changes");
                                setState(() {
                                  widget.obscureText = !(widget.obscureText);
                                });
                              },
                              icon:
                              widget.obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            )),
                      ],
                    ),
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            width: 1.5,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          )),
                      onPressed: () async {
                        String name = widget.regEditor.text.trim();
                        String password = widget.passEditor.text.trim();
                        if (name.compareTo("") == 0) {
                          showToast("username/email cant be empty");
                          return;
                        } else if (password.length < 8) {
                          showToast("password should consist of atleast 8 digits");
                          return;
                        }
                        BlocProvider.of<AuthBloc>(context).add(Login(name, password));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Theme
                              .of(context)
                              .primaryColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom == 0
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpPage.id);
                        },
                        style: const ButtonStyle(),
                        child: Text(
                          'Need an account? SignUp',
                          style: TextStyle(
                              decoration: TextDecoration.underline, color: Theme
                              .of(context)
                              .primaryColor),
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
      },
    );
    BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {}),
    );
  }
}
