import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/model/jogador_model.dart';
import 'package:flutter_front/services/api.dart';

import 'edit.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deletar"),
      ),
      body: FutureBuilder(
        future: Api.getJogador(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Jogador> jdata = snapshot.data;

            return ListView.builder(
              itemCount: jdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text("${jdata[index].nome}"),
                  subtitle: Text("${jdata[index].categoria}"),
                  trailing: IconButton(
                      onPressed: () async {
                        await Api.deleteJogador(jdata[index].id);
                        jdata.removeAt(index);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
