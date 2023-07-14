import 'package:flutter/material.dart';
import 'package:flutter_front/model/jogador_model.dart';
import 'package:flutter_front/services/api.dart';

class FecthData extends StatelessWidget {
  const FecthData({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getJogador(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else {
            List<Jogador> jdata = snapshot.data;

            return ListView.builder(
              itemCount: jdata.length,
              itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text("${jdata[index].nome}"),
                    subtitle: Text("${jdata[index].categoria}"),
                    trailing: Text("${jdata[index].clube}"),
                  );
            },
            );
          }
        },
      ),
    );
  }
}
