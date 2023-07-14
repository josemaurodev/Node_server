import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/services/api.dart';

import 'home.dart';
import 'model/jogador_model.dart';

class EditScreen extends StatefulWidget {
  final Jogador data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nomeController = TextEditingController();
  var clubeController = TextEditingController();
  var categoriaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.data.nome.toString();
    clubeController.text = widget.data.clube.toString();
    categoriaController.text = widget.data.categoria.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(hintText: "O nome aqui"),
            ),
            TextField(
              controller: categoriaController,
              decoration: const InputDecoration(hintText: "A categoria aqui"),
            ),
            TextField(
              controller: clubeController,
              decoration: const InputDecoration(hintText: "O clube aqui aqui"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Api.updateJogador(widget.data.id, {
                    "jnome": nomeController.text,
                    "jcategoria": categoriaController.text,
                    "jclube": clubeController.text,
                    "id": widget.data.id
                  });

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TelaInicial()));
                },
                child: const Text("Jogador Editado"))
          ],
        ),
      ),
    );
  }
}
