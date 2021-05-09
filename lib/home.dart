import 'package:flutter/material.dart';
import 'package:youtube/pesquisaDelegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/emAlta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';

import 'API.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int indiceA = 0;
  String resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(resultado),
      Inscricao(),
      EmAlta(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset("resources/youtube.png", width: 98, height: 22,),
        actions: [
          IconButton(icon: Icon(Icons.videocam),
              onPressed: ()  {
            print("bala video");
          }),
          IconButton(icon: Icon(Icons.search), onPressed: () async {
            String res = await showSearch(context: context, delegate: Pesquisador());
            setState(() {
              resultado = res;
            });

          }),
          IconButton(icon: Icon(Icons.account_circle), onPressed: (){
            print("bala conta");
          })

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[indiceA],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceA,
        onTap: (indice){
          setState(() {
            indiceA = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Início")),
        BottomNavigationBarItem(icon: Icon(Icons.whatshot), title: Text("Em alta"), backgroundColor: Colors.red),
        BottomNavigationBarItem(icon: Icon(Icons.subscriptions), title: Text("Inscrições")),
        BottomNavigationBarItem(icon: Icon(Icons.folder), title: Text("Biblioteca")),
      ],),
    );
  }
}
