import 'package:fabricio/model/aluno.dart';
import 'package:flutter/material.dart';

class InputMedia extends StatefulWidget {
  const InputMedia({Key? key}) : super(key: key);

  @override
  _InputMediaState createState() => _InputMediaState();
}

class _InputMediaState extends State<InputMedia> {
  TextEditingController edtNome = TextEditingController();
  TextEditingController edtNota1 = TextEditingController();
  TextEditingController edtNota2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text("Cadastrar Notas"),
    );
  }

  buildBody() {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: edtNome,
            decoration: InputDecoration(labelText: "Nome:"),
          ),
          TextField(
            controller: edtNota1,
            decoration: InputDecoration(labelText: "Nota1:"),
          ),
          TextField(
            controller: edtNota2,
            decoration: InputDecoration(labelText: "Nota2:"),
          )
        ],
      ),
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        actionBackListMedias();
      },
      child: Icon(Icons.save),
    );
  }

  void actionBackListMedias() {
    var snack;
    if (edtNome.text.isEmpty) {
      snack = SnackBar(
        content: Text("Informe o nome"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return;
    }
    if (edtNota1.text.isEmpty) {
      snack = SnackBar(
        content: Text("Informe a nota1"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return;
    }
    if (edtNota2.text.isEmpty) {
      snack = SnackBar(
        content: Text("Informe a nota2"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return;
    }
    Aluno aluno = Aluno(edtNome.text, double.parse(edtNota1.text),
        double.parse(edtNota2.text), 0);
    Navigator.pop(context, aluno);
  }
}
