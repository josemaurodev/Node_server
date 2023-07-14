import 'package:flutter/material.dart';
import 'package:flutter_front/home.dart';
import 'package:flutter_front/services/api.dart';

class CreateData extends StatefulWidget {
  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  var nomeController = TextEditingController();
  var clubeController = TextEditingController();
  var categoriaController = TextEditingController();
  var golsController = TextEditingController();
  var cartoesController = TextEditingController();
  var suspensoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(hintText: "Nome do jogador"),
              ),
              TextField(
                controller: clubeController,
                decoration: const InputDecoration(hintText: "Clube do jogador"),
              ),
              TextField(
                controller: categoriaController,
                decoration:
                    const InputDecoration(hintText: "Categoria do jogador"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var data = {
                      "jnome" : nomeController.text,
                      "jclube" : clubeController.text, 
                      "jcategoria" : categoriaController.text
                    };
      
                    Api.addJogador(data);
      
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TelaInicial()));
                  },
                  child: const Text("Criar jogador"))
            ],
          ),
        ),
      ),
    );
  }
}
