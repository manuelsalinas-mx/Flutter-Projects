import 'package:flutter/material.dart';
import 'package:forms_app/config/helpers/email_regexp.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 50),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // form values
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          CustomTextFormField(
              label: 'Username',
              onChanged: (text) => username = text,
              validator: (text) {
                if (text == null || text.trim().isEmpty) return 'Username is required';
                if (text.length < 6) return 'Username must contain 6 characters at least';
                return null;
              }),
          const SizedBox(height: 10),
          CustomTextFormField(
              label: 'Email',
              onChanged: (text) => email = text,
              validator: (text) {
                if (text == null || text.trim().isEmpty) return 'Email is required';
                if (!emailRegExp.hasMatch(text)) return 'Invalid email format';
                return null;
              }),
          const SizedBox(height: 10),
          CustomTextFormField(
              label: 'Password',
              isObscure: true,
              onChanged: (text) => password = text,
              validator: (text) {
                 if (text == null || text.trim().isEmpty) return 'Password is required';
                if (text.length < 7) return 'Password must contain 7 characters at least';
                
                return null;
              }),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (!isValid) return;

                print("{$username, $email, $password}");
              },
              icon: const Icon(Icons.save),
              label: const Text('Crear usuario')),
        ]));
  }
}
