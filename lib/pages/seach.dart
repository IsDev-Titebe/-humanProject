import 'package:flutter/material.dart';



class DataSearch extends SearchDelegate <String>{


  final citie = [
    'barumbu',
    "bandal",
    "kimbaseke",
    "djili",
    "kalamu",
    "lemba",
    "matete",
    "kingasani",
    "makala",
    "maluku",
    "kinseso",
    "matonge",
    "nike",
    "adidas",
    "puma",
    "kinshasa",
    "mbandaka",
    "kisangani",
    "titebe",
    "kasa vubu",
    "makuta",
    "muyanku"
  ];


  final recentCities = [
    "Kinshasa",
    "Mbandaka",
    "Kisangani",
    "Titebe",
    "Kasa vubu",
  ];



  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.clear),
          onPressed:(){
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ), onPressed: (){
      close(context, null);
    }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }
  //.toLowerCase()
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ?
    recentCities :
    citie.where((u) => (u).startsWith(query.toLowerCase() )).toList();
    return ListView.builder(
      itemBuilder: (context, index) =>
          ListTile(
              leading:Icon(Icons.scatter_plot),
              title:RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0,query.length),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    children: [TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey)
                    )]
                ),
              )
          ),
      itemCount: suggestionList.length ,
    );
  }

}