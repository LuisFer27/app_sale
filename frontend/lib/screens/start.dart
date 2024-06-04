//import 'package:app_sale/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppSale'), actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app,
                color: Theme.of(context).colorScheme.primary))
      ]),
      //drawer: MainDrawer(onSelectScreen: onSelectScreen),
      body: const Center(
        child: Text('Inicio'),
        //  child: Column(
        //  children: [
        //    Expanded(
        //      child: ChatMessages(),
        //    ),
        //    NewMessage()
        //  ],
        //),
      ),
    );
  }
}
