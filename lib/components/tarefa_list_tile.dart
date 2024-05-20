import 'package:auto_control_panel/models/tarefa.dart';
import 'package:auto_control_panel/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_control_panel/routes.dart';
import 'package:intl/intl.dart';

class TarefaListTile extends StatelessWidget {
  const TarefaListTile({
    super.key,
    required this.tarfs,
    required this.index,
  });

  final Tarefa tarfs;
  final int index;

  @override
  Widget build(BuildContext context) {
    String name = tarfs.nome;
    DateTime dtHora = tarfs.dataHora;
    String geoloc = tarfs.geolocalizacao;

    return ListTile(
      leading: const Icon(Icons.edit_note),
      title: Text('Descrição: $name'),
      subtitle: Text('Data:${DateFormat('dd/MM/yyyy HH:mm').format(dtHora)}'),
      trailing: Text('Latitude Longitude \n$geoloc'),
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.DETAILS,
          arguments: {'tarefa': tarfs, 'index': index},
        );
      },
    );
  }
}
