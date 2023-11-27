import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_sihotel/ui/hotel/sihotel_awal.dart';
import 'package:project_sihotel/ui/hotel/sihotel_data.dart';

import '../../../bloc/user/login/login_user_bloc.dart';
import '../register/register_user.dart';

class LoginPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => LoginUserBloc(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  BlocConsumer<LoginUserBloc, LoginUserState>(
                    listener: (context, state) {
                      if (state is LoginUserSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.loginUserResponse.message)));
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginUserLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is LoginUserError) {
                        return Center(
                          child: Text(state.message),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginUserBloc>().add(
                                LoginVisitorsEvent(
                                    username:
                                        usernameController.text.toString(),
                                    password:
                                        passwordController.text.toString()));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SihotelData()),
                            );
                          }
                        },
                        child: Text('Login'),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Belum punya akun?'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterUserPage()),
                            );
                          },
                          child: Text('Register',
                            style: TextStyle(
                              color: Colors.blue,
                            ),),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text('Belum punya akun?'),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 4),
                  //       child: TextButton(
                  //         onPressed: () {
                  //           Navigator.pushReplacement(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => RegisterUSerPage()),
                  //           );
                  //         },
                  //         child: Text('Register'),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
