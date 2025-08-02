import 'package:flutter/material.dart';
import 'mycolors.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}



class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userToDo = '';
  List listToDo = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.dinoYellow,
        title: Text('TO DO LIST', style: TextStyle(color: MyColors.dinoBrown, fontWeight: FontWeight.bold),),
      ),
      body:
      Container(
        color: MyColors.dinoWhite,
        child: ListView.builder(

          itemCount: listToDo.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
              key: Key(listToDo[index]),
              child: Card(
                child: ListTile(title: Text(listToDo[index])),
              ),
              onDismissed: (direction){
                return
                  setState(() {
                    listToDo.removeAt(index);
                  });
              },
            );
          }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.dinoGreen,
        onPressed: (){

        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(

            title: Text("Enter data"),
            content: TextField(
              onChanged: (String value){
                userToDo = value;
              },
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.dinoGreen, // цвет кнопки
                  foregroundColor: MyColors.dinoWhite,
                ),

                  onPressed: (){
                setState(() {
                  listToDo.add(userToDo);
                  Navigator.of(context).pop();
                });
              },
                  child: Text('ADD')

              )
            ],

          );

        });

      },
        child: Icon(Icons.add, color: MyColors.dinoWhite,),
      ),

    );

  }
}
