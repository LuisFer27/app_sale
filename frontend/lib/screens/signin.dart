import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/user_image_picker.dart';
import 'package:http/http.dart' as http;

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  @override
  State<SigninScreen> createState() {
    return _SigninScreenState();
  }
}

class _SigninScreenState extends State<SigninScreen> {
  File? _selectedImage;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //final _nameController = TextEditingController();

  Future<void> _register() async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://localhost:8000/api/usuarios'),
    );
    request.fields['name'] = 'Nombre';
    request.fields['lastName'] = 'Apellidos';
    request.fields['email'] = _emailController.text;
    request.fields['correo'] = '5512345678';
    request.fields['password'] = _passwordController.text;
    final response = await request.send();
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario creado con éxito')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al crear el usuario')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UserImagePicker(
                            onPickImage: (pickedImage) {
                              _selectedImage = pickedImage;
                            },
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                labelText: 'Correo Electrónico'),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Por favor inserta una dirección de correo electrónico valida';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // _enteredEmail = value!;
                            },
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration:
                                const InputDecoration(labelText: 'Contraseña'),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'La contraseña debe de tener 6 caracteres';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              //_enteredPassword = value!;
                            },
                          ),
                          ElevatedButton(
                            //onPressed: _submit,
                            onPressed: () {
                              _register();
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: const Text('Crear cuenta'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                                'Ya dispones de una cuenta Inicia Sesión.'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
