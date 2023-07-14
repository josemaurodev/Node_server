import 'package:flutter/material.dart';
import 'package:flutter_front/create.dart';
import 'package:flutter_front/fetch.dart';
import 'package:flutter_front/update.dart';

import 'delete.dart';

class TelaInicial extends StatefulWidget {
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(150.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CreateData()));
                  },
                  child: Text("CREATE")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FecthData()));
                  },
                  child: Text("READ")),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DeleteScreen()));
                }, 
                child: Text("DELETE")),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UpdateScreen()));
                }, 
                child: Text("UPDATE")),
            ],
          ),
        ),
      ),
    );
  }
}
