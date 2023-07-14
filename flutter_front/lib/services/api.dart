import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/jogador_model.dart';

class Api {
  static const baseUrl = "http://192.168.15.12/api/";

  //Criar jogador
  static addJogador(Map jdata) async {
    debugPrint("AQUI O QUE EU TO ENVIANDO PARA A API ----------> ${jdata}");
    var url = Uri.parse("${baseUrl}add_jogador");
    try {
      final res = await http.post(url, body: jdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        debugPrint("retorno do status: ${data}");
      } else {
        print("Nao consegui resposta de volta");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //Pegar jogador do back

  static getJogador() async {
    List<Jogador> jogadores = [];

    var url = Uri.parse("${baseUrl}get_jogador");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data['jogadores'].forEach(
          (value) => {
            jogadores.add(
              Jogador(
                value['jnome'],
                value['jclube'],
                value['jcategoria'],
                value['id'].toString(),
              ),
            ),
          },
        );

        return jogadores;
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  //Editar o jogador
  static updateJogador(id, body) async {
    debugPrint("${body}");
    var url = Uri.parse("${baseUrl}update/$id");

    final res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Falha ao editar o jogador");
    }
  }

  //Excluir o jogador
  static deleteJogador(id) async {
    var url = Uri.parse("${baseUrl}delete/$id}");

    final res = await http.post(url);
    if (res.statusCode == 204) {
      print(jsonDecode(res.body));
    } else {
      print("Falha ao deletar");
    }
  }
}
