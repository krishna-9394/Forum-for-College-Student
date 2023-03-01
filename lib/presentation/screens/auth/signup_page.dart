import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:node_bb_application/presentation/screens/auth/login_page.dart';
import 'package:toast/toast.dart';

import '../../../business_logics/auth/auth_bloc.dart';
import '../category_list.dart';

class SignUpPage extends StatefulWidget {
  static const id = 'Sign Up Page';
  final TextEditingController userEditor = TextEditingController();
  final TextEditingController emailEditor = TextEditingController();
  final TextEditingController passEditor = TextEditingController();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void showToast(String message) {
    Toast.show(message,
        backgroundColor: Colors.grey,
        backgroundRadius: 20,
        duration: Toast.lengthLong,
        gravity: Toast.bottom);
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToast("Successful Signup...");
          Map<String, dynamic> data = state.data;
          Navigator.pushNamed(context, CategoryList.id,arguments: {'uid'});
        }
      },
      builder: (context, state) {
        if (state is DataFillingState) {
          return Scaffold(
            body: Form(
              key: widget._formKey,
              child: Column(
                mainAxisAlignment: MediaQuery.of(context).viewInsets.bottom != 0
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
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
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              width: 2.5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xffdfdfde),
                                border: Border.fromBorderSide(
                                  BorderSide(
                                      color: Color(0xffbcb5b5), width: 2.5),
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
                                  fontFamily:
                                      'CormorantGaramond-LightItalic.ttf'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('SignUp', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: widget.emailEditor,
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
                        labelText: 'Email',
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
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: widget.userEditor,
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
                        labelText: 'Username',
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
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
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
                        Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.obscureText = !(widget.obscureText);
                                });
                              },
                              icon: widget.obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
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
                            color: Theme.of(context).primaryColor,
                          )),
                      onPressed: () async {
                        String username = widget.userEditor.text.trim();
                        String email = widget.emailEditor.text.trim();
                        String password = widget.passEditor.text.trim();
                        if (username.compareTo("") == 0 ||
                            email.compareTo("") == 0) {
                          showToast("username/email cant be empty");
                          return;
                        } else if (password.length < 8) {
                          showToast(
                              "password should consist of atleast 8 digits");
                          return;
                        }
                        BlocProvider.of<AuthBloc>(context)
                            .add(SignUp(username, password, email));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "SignUp",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
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
                              onPressed: () {
                                Navigator.pushNamed(context, LoginPage.id);
                              },
                              style: const ButtonStyle(),
                              child: Text(
                                'Already a user? Login',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(width: 5),
                ],
              ),
            ),
          );
        } else if (state is UserAlreadyExist) {
          showToast("password is weak...");
          return Scaffold(
            body: Form(
              key: widget._formKey,
              child: Column(
                mainAxisAlignment: MediaQuery.of(context).viewInsets.bottom != 0
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
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
                            Image.network(
                              "https://lh5.googleusercontent.com/uGOb6P_0AGqCgnznTSrOLnsl1z5rJkrwz0v3nlP6WGwQ_I3IfMqeoHhPxt2RrjgMLbo=w2400",
                              height: 150,
                              width: 150,
                            ),
                            const SizedBox(width: 20),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              width: 2.5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xffdfdfde),
                                border: Border.fromBorderSide(
                                  BorderSide(
                                      color: Color(0xffbcb5b5), width: 2.5),
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
                                  fontFamily:
                                      'CormorantGaramond-LightItalic.ttf'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('SignUp', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: widget.emailEditor,
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
                        labelText: 'Email',
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
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: widget.userEditor,
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
                        labelText: 'Username',
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
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
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
                        Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.obscureText = !(widget.obscureText);
                                });
                              },
                              icon: widget.obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
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
                            color: Theme.of(context).primaryColor,
                          )),
                      onPressed: () async {
                        String username = widget.userEditor.text.trim();
                        String email = widget.emailEditor.text.trim();
                        String password = widget.passEditor.text.trim();
                        if (username.compareTo("") == 0 ||
                            email.compareTo("") == 0) {
                          showToast("username/email cant be empty");
                          return;
                        } else if (password.length < 8) {
                          showToast(
                              "password should consist of atleast 8 digits");
                          return;
                        }
                        BlocProvider.of<AuthBloc>(context)
                            .add(SignUp(username, password, email));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "SignUp",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
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
                              onPressed: () {
                                Navigator.pushNamed(context, LoginPage.id);
                              },
                              style: const ButtonStyle(),
                              child: Text(
                                'Already a user? Login',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(width: 5),
                ],
              ),
            ),
          );
        } else if (state is SignUpState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is FailedToSignUpState) {
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
                mainAxisAlignment: MediaQuery.of(context).viewInsets.bottom != 0
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
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
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              width: 2.5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xffdfdfde),
                                border: Border.fromBorderSide(
                                  BorderSide(
                                      color: Color(0xffbcb5b5), width: 2.5),
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
                                  fontFamily:
                                      'CormorantGaramond-LightItalic.ttf'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('SignUp', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: widget.emailEditor,
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
                        labelText: 'Email',
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
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: widget.userEditor,
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
                        labelText: 'Username',
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
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
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
                        Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.obscureText = !(widget.obscureText);
                                });
                              },
                              icon: widget.obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
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
                            color: Theme.of(context).primaryColor,
                          )),
                      onPressed: () async {
                        String username = widget.userEditor.text.trim();
                        String email = widget.emailEditor.text.trim();
                        String password = widget.passEditor.text.trim();
                        if (username.compareTo("") == 0 ||
                            email.compareTo("") == 0) {
                          showToast("username/email cant be empty");
                          return;
                        } else if (password.length < 8) {
                          showToast(
                              "password should consist of atleast 8 digits");
                          return;
                        }
                        BlocProvider.of<AuthBloc>(context)
                            .add(SignUp(username, password, email));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "SignUp",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
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
                              onPressed: () {
                                Navigator.pushNamed(context, LoginPage.id);
                              },
                              style: const ButtonStyle(),
                              child: Text(
                                'Already a user? Login',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context).primaryColor),
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
  }
}
