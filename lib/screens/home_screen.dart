import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../db_helper.dart';
import '../note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedId;

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: textController,
          decoration: new InputDecoration(
            icon: new Icon(Icons.app_registration_outlined),
            labelText: "Select And Edit",




          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Note>>(
            future: DatabaseHelper.instance.getNotes(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? Center(child: Text('No Notes Yet!'))
                  : ListView(
                      children: snapshot.data!.map((note) {
                        return Center(
                          child: Card(

                            color: selectedId == note.id
                                ? Colors.blue
                                : Colors.tealAccent,
                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              leading: Icon(Icons.arrow_forward_ios),
                              title: Text(note.note),
                              onTap: () {
                                setState(() {
                                  if (selectedId == null) {
                                    textController.text = note.note;
                                    selectedId = note.id;
                                  } else {
                                    textController.text = '';
                                    selectedId = null;
                                  }
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  DatabaseHelper.instance.remove(note.id!);
                                });
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          selectedId != null
              ? await DatabaseHelper.instance.update(
                  Note(id: selectedId, note: textController.text),
                )
              : await DatabaseHelper.instance.add(
                  Note(note: textController.text),
                );
          setState(() {
            textController.clear();
            selectedId = null;
          });
        },
      ),
    );
  }
}
