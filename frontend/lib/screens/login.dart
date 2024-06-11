import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  Future<void> _register() async {
    //enlace de conexión
    final url = Uri.parse('http://10.0.2.2:8000/api/login');

    //campos
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': _email, 'password': _password}));
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
                          TextFormField(
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: const Text('Iniciar Sesión'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Crea una cuenta.'),
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
