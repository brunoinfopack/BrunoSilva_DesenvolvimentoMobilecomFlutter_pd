import 'package:auto_control_panel/components/tarefa_form.dart';
import 'package:auto_control_panel/providers/tarefa_provider.dart';
import 'package:auto_control_panel/routes.dart';
import 'package:auto_control_panel/screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/tarefa_list.dart';
import '../models/tarefa.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.blueAccent,
      title: const Text("Lista de Tarefas"),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.ABOUT).then((value) {            
              });
            },
            icon: const Icon(Icons.info))
      ]),
      body: TarefaList(),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.add_task),
              title: const Text("Nova Tarefa"),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.pushNamed(context, Routes.FORM),
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Sobre Nós"),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.pushNamed(context, Routes.ABOUT),
              },
            ),
          ],
        ),
      ),
    );
  }
}
