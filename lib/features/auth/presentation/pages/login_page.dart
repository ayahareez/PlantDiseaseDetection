import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/plant_photo_page.dart';
import '../bloc/auth_bloc/authentication_bloc.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();

  var password = TextEditingController();

  GlobalKey<FormState> keyLogin = GlobalKey();

  @override
  void initState() {
    context.read<AuthenticationBloc>().add(CheckIfAuthEvent());
    super.initState();
  }

  String? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          if (state is Authorized) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const PlantPhotoPage()));
          }
          if (state is AuthError) {
            showToast("An error occurred: ${state.error}");
          }
        },
        builder: (context, state) {
          print(state);
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UnAuthorized || state is AuthError) {
            return Form(
              key: keyLogin,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Lottie.asset(
                            'assets/animations/Animation - 1706314168418.json',
                            // Replace with the actual path to your Lottie JSON file
                            width: 250,
                            height: 250,
                            // Other options...
                          ),
                        ),
                        const LocaleText(
                          'heading',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MyFont'),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                          ),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'field can not be null';
                            }
                            if (text.length < 6 ||
                                !text.contains('@') ||
                                !text.endsWith('.com') ||
                                text.startsWith('@')) {
                              return 'Wrong data ';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: password,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                          ),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'field can not be null';
                            }
                            if (text.length < 8) {
                              return 'password must be strong';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 35.0,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff276E23),
                                Color(0xff38b000),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              if (keyLogin.currentState!.validate()) {
                                try {
                                  User? user =
                                      FirebaseAuth.instance.currentUser;

                                  if (user != null) {
                                    userId = user.uid;
                                  }

                                  context.read<AuthenticationBloc>().add(
                                        SignInEvent(
                                          email: email.text,
                                          password: password.text,
                                        ),
                                      );
                                } catch (e) {
                                  // Handle login errors, e.g., show a toast message
                                  Fluttertoast.showToast(
                                      msg: 'Login failed: $e');
                                }
                              }
                            },
                            child: const LocaleText(
                              'heading',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const LocaleText(
                              'no_account',
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'MyFont'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SignUpPage()));
                              },
                              child: const LocaleText('register',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff276E23),
                                      fontFamily: 'MyFont')),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              context
                                  .read<AuthenticationBloc>()
                                  .add(SignInAnonymouslyEvent());
                            },
                            child: const LocaleText('login_guest',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff276E23),
                                    fontFamily: 'MyFont')),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}