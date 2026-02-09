import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter_application_1/widgets/note_card.dart';
import 'package:flutter_application_1/screens/add_edit_note_screen.dart';


class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState(); 
}


class _NotesListScreenState extends State<NotesListScreen> {
  List<Note> notes = [
    Note( id: '1', title: 'First Note', content: 'This is the content of the first note.'),
    Note(id: '2', title: 'Second Note', content: 'This is the content of the second note.'),
    Note(id: '3', title: 'Third Note', content: 'This is the content of the third note.'),
    Note(id: '4', title: 'Fourth Note', content: 'This is the content of the fourth note.'),
    Note(id: '5', title: 'Fifth Note', content: 'This is the content of the fifth note.'),

  ];

  String searchText="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Notes'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          AnimatedSearchBar(
          label: "Search Something Here",
          onChanged: (value) {
            debugPrint("value on Change");
            setState(() {
              searchText = value;
            });
          },
        ),
        Expanded(child: 
        ListView.builder(itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteCard(note: notes[index], onDelete: () {
              setState(() {
                notes.removeAt(index);
              });
            },);  
          },
        ),
        ), 
        ],
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to Add Note Screen
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddEditNoteScreen()
              )
            );
          },
          child: const Icon(Icons.add)
      )
    );
  }
  
}