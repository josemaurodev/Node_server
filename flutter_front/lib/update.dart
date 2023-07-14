import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/model/jogador_model.dart';
import 'package:flutter_front/services/api.dart';

import 'edit.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar"),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditScreen(data: jdata[index]),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit)
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
