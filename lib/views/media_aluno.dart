import 'package:fabricio/model/aluno.dart';
import 'package:fabricio/views/input_media.dart';
import 'package:flutter/material.dart';

class MediaAluno extends StatefulWidget {
  const MediaAluno({Key? key}) : super(key: key);

  @override
  _MediaAlunoState createState() => _MediaAlunoState();
}

class _MediaAlunoState extends State<MediaAluno> {
  List<Aluno> alunos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatActionButton(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text("Lista de Medias do Aluno"),
    );
  }

  buildBody() {
    return ListView.builder(
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          return itemBuilder(index);
        });
  }

  buildFloatActionButton() {
    return FloatingActionButton(
      onPressed: () {
        ActionNavigationInputMedia();
      },
      child: Icon(Icons.add),
    );
  }

  itemBuilder(int index) {
    return Container(
      height: 100,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: ${alunos[index].nome}"),
            Text("Media: ${alunos[index].media}")
          ],
        ),
      ),
    );
  }

  void ActionNavigationInputMedia() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return InputMedia();
    })).then((aluno) {
      setState(() {
        alunos.add(aluno);
      });
    });
  }
}
