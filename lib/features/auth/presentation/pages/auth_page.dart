import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Login')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.goNamed('dashboard');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logged in successfully')),
            );
          } else if (state is AuthUnauthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logged out')),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Required' : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            setState(() {
                              _emailController.text = "hendra@hendracodes.com";
                              _passwordController.text = "hendra123";
                            });

                            // Trigger the login event
                            context.read<AuthBloc>().add(
                                  LoginAuthEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                            // if (_formKey.currentState?.validate() ?? false) {
                            //   setState(() {
                            //     _emailController.text =
                            //         "hendra@hendracodes.com";
                            //     _passwordController.text = "hendra123";
                            //   });

                            //   // Trigger the login event
                            //   context.read<AuthBloc>().add(
                            //         LoginAuthEvent(
                            //           email: _emailController.text,
                            //           password: _passwordController.text,
                            //         ),
                            //       );
                            // }
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
