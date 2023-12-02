import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SubjectsScreen(),
    );
  }
}

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  List<String> _subjects=["Менаџмент инфромациски системи","Мобилни информациски системи","Анализа и дизајн на ИС","Администрација на системи"];
  void addSubject()
  {
    showDialog(context: context, builder: (BuildContext context){
      String newSubjects="";
      return AlertDialog(
        title: const Text("Add a new subject"),
        content: TextField(
          onChanged: (value){
            newSubjects=value;
          },
        ),
        actions: [
          ElevatedButton(
              onPressed: (){
                setState(() {
                  if (newSubjects.isNotEmpty)
                    {
                      _subjects.add(newSubjects);
                    }
                  Navigator.pop(context);
                });
              },
              child: const Text("Add"))
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("201081"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount:_subjects.length,
          itemBuilder: (context,index) {
          return Card(
            child: ListTile(
              title: Text(_subjects[index],style: const TextStyle(fontSize: 19),),
              trailing: IconButton(icon: const Icon(Icons.delete_sharp),onPressed: (){
                setState(() {
                  _subjects.removeAt(index);
                });
              },),

            ),
          );

      }),
      floatingActionButton: FloatingActionButton(onPressed: addSubject,
        backgroundColor:Colors.greenAccent ,
        child: const Icon(Icons.add_box_sharp),
      ),

    );

  }
}


