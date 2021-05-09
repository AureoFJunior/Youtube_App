import 'package:flutter/material.dart';

class Pesquisador extends SearchDelegate<String> {


  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> lista = new List();

    if(query.isNotEmpty){
      lista = [
        "Android", "Android navegação", "IOS", "Jogos"
      ].where(
              (texto) => texto.toLowerCase().startsWith( query.toLowerCase() )
      ).toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context, lista[index]);
            },
            title: Text(lista[index]),

          );
        },
      );
    }
    else {
      return Center(
        child: Text("Não achamo nada, menó!"),
      );
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      }),

    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();


  }
}