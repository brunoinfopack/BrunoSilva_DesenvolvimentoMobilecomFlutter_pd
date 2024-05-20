import 'package:auto_control_panel/models/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TarefaProvider extends ChangeNotifier {
  int number = 0;

  List<Tarefa>? tarefas = [
    Tarefa('Fazer o projeto da disciplina de Flutter', DateTime.parse('2024-05-20 23:59'),'-23.5393601 -47.4738948'),
    Tarefa('Fazer compras no mercado', DateTime.parse('2024-06-06 19:00'), '-23.5307451 ,-47.4662306'),
    Tarefa('Levar filha na escola', DateTime.parse('2024-05-20 12:45'), '-23.5079634 -47.4745328'),
    Tarefa('Ir a academia', DateTime.parse('2024-05-20 18:30'), '-23.5393601 -47.4738948'),
    Tarefa('Levar cachorro para passear', DateTime.parse('2024-05-20 08:00'), '-23.53938 -47.4738948'),
  ];

  void addTarefa(Tarefa tarfs) {
    tarefas?.add(tarfs);
    notifyListeners();
  }

  void removeTarefa(int index) {
    tarefas?.removeAt(index);
    notifyListeners();
  }

  void editTarefa(int index, Tarefa tarfs) {
    tarefas?[index].nome = tarfs.nome;
    tarefas?[index].dataHora = tarfs.dataHora;
    tarefas?[index].geolocalizacao = tarfs.geolocalizacao;
    notifyListeners();
  }
}
