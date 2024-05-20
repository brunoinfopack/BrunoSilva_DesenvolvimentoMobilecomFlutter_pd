import 'package:auto_control_panel/components/tarefa_edit_form.dart';
import 'package:auto_control_panel/components/tarefa_form.dart';
import 'package:auto_control_panel/models/tarefa.dart';
import 'package:auto_control_panel/providers/tarefa_provider.dart';
import 'package:auto_control_panel/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argumentos =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final Tarefa tarfs = argumentos['tarefa'];
    final int index = argumentos['index'];

    final tarefaProvider = context.read<TarefaProvider>();
    final deleteTarefa = tarefaProvider.removeTarefa;
    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed: () => Navigator.pop(context, false),
    );
    Widget continueButton = TextButton(
      child: const Text("Excluir"),
      onPressed: () {
        final tarefs = Tarefa(tarfs.nome, tarfs.dataHora, tarfs.geolocalizacao);
        deleteTarefa(index);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Excluído com Sucesso')));
        Navigator.pushNamed(context, Routes.HOME);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Exclusão"),
      content: const Text("Deseja realmente excluir a Tarefa?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Detalhes"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: TarefaEditForm(index: index, tarfs: tarfs),
    );
  }
}
