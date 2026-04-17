import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String correctEmail = "meca@gmail.com";
  final String correctPassword = "aguantemeca01";

  String stepText = "Mail:";
  String message = "Bienvenido";

  String emailInput = "";
  TextEditingController controller = TextEditingController();

  bool isEmailStep = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mensaje central
            Text(
              message,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),

            // Texto que cambia (Mail / Contraseña)
            Text(
              stepText,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                obscureText: !isEmailStep, // oculta si es contraseña
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isEmailStep) {
                    if (controller.text == correctEmail) {
                      emailInput = controller.text;
                      controller.clear();
                      isEmailStep = false;
                      stepText = "Contraseña:";
                      message = "Ingrese contraseña";
                    } else {
                      message = "Mail/Contraseña incorrecto";
                    }
                  } else {
                    if (controller.text == correctPassword) {
                      message = "Bienvenido $emailInput";
                    } else {
                      message = "Mail/Contraseña incorrecto";
                    }
                  }
                });
              },
              child: const Text("Ingresar"),
            ),
          ],
        ),
      ),
    );
  }
}