import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/screens/login.dart';
import 'package:frontend/widgets/user_image_picker.dart';
import 'package:http/http.dart' as http;

//clase signin screen permite crear los datos del usuario
class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  @override
  State<SigninScreen> createState() {
    return _SigninScreenState();
  }
}

class _SigninScreenState extends State<SigninScreen> {
  File? _selectedImage;
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  //final _nameController = TextEditingController();

  Future<void> _register() async {
    //enlace de conexión
    final request = http.MultipartRequest(
      'POST',
      //10.0.2.2 equivale a localhost
      Uri.parse('http://10.0.2.2:8000/api/store'),
    );
    //campos
    request.fields['name'] = _nameController.text;
    request.fields['lastName'] = _lastnameController.text;
    request.fields['email'] = _emailController.text;
    request.fields['phone'] = '5512345678';
    request.fields['password'] = _passwordController.text;
    final response = await request.send();
    //mensaje de confirmación
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
                            controller: _nameController,
                            decoration:
                                const InputDecoration(labelText: 'Nombre'),
                            keyboardType: TextInputType.name,
                            autocorrect: false,
                          ),
                          TextFormField(
                            controller: _lastnameController,
                            decoration:
                                const InputDecoration(labelText: 'Apellidos'),
                            keyboardType: TextInputType.name,
                            autocorrect: false,
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const LoginScreen(),
                                ),
                              );
                            },
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
