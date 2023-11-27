import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_sihotel/bloc/user/register/register_user_bloc.dart';
import 'package:project_sihotel/ui/user/login/login_user.dart';

class RegisterUserPage extends StatelessWidget {
  RegisterUserPage({super.key});

  TextEditingController tecUsername = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecFirstName = TextEditingController();
  TextEditingController tecLastName = TextEditingController();
  TextEditingController tecPassword1 = TextEditingController();
  TextEditingController tecPassword2 = TextEditingController();
  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register User'),
      ),
      body: BlocProvider(
        create: (context) => RegisterUserBloc(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formState,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: tecUsername,
                      decoration: InputDecoration(
                        label: Text('Nama Akun'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Nama Akun';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: tecEmail,
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: tecFirstName,
                      decoration: InputDecoration(
                        label: Text('Nama Depan'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Nama Depan';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: tecLastName,
                      decoration: InputDecoration(
                        label: Text('Nama Belakang'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Nama Belakang';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: tecPassword1,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: tecPassword2,
                      decoration: InputDecoration(
                        label: Text('Masukkan Password lagi'),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi ulang Password';
                        } else if (value != tecPassword1.text) {
                          return 'Password tidak cocok';
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocConsumer<RegisterUserBloc, RegisterUserState>(
                    listener: (context, state) {
                      if (state is RegisterUserSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.registerUserResponse.message)));
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterUserLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is RegisterUserError) {
                        return Center(
                          child: Text(state.message),
                        );
                      }
                      return Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              context.read<RegisterUserBloc>().add(
                                  CreateAuthorsEvent(
                                      username: tecUsername.text.toString(),
                                      email: tecEmail.text.toString(),
                                      isActive: true,
                                      isAdmin: true,
                                      firstName: tecFirstName.text.toString(),
                                      lastName: tecLastName.text.toString(),
                                      password1: tecPassword1.text.toString(),
                                      password2: tecPassword2.text.toString()));
                            }
                          },
                          child: Text('Register'),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Sudah punya akun?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text('Login'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
