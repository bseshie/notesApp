import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/widgets/note_card.dart';
import 'package:flutter_application_1/screens/add_edit_note_screen.dart';
import 'package:flutter_application_1/models/notes_model.dart';
// import 'package:logger/logger.dart';


class NotesListScreen extends StatefulWidget {
  final NotesModel? notesModel;
  // constructor for  NoteListScreeen that takes in an optional NotesModel parameter. This allows the NotesListScreen to receive a NotesModel instance when it is created, which can be used to manage the list of notes displayed on the screen. If no NotesModel is provided, it can be initialized within the state of the NotesListScreen.
  const NotesListScreen({super.key, required this.notesModel});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState(); 
}


class _NotesListScreenState extends State<NotesListScreen> {
  // List<Note> notes = [
  //   Note( id: '1', title: 'First Note', content: 'This is the content of the first note.'),
  //   Note(id: '2', title: 'Second Note', content: 'This is the content of the second note.'),
  //   Note(id: '3', title: 'Third Note', content: 'This is the content of the third note.'),
  //   Note(id: '4', title: 'Fourth Note', content: 'This is the content of the fourth note.'),
  //   Note(id: '5', title: 'Fifth Note', content: 'This is the content of the fifth note.'),

  // ];

  // late NotesModel notesModel;
  String searchText="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // notesModel = NotesModel();
    // Logger().d("NotesModel initialized with ${notesModel.noteCount} notes.");
  }

 
  
  // String searchText="";

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Notes'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
          
          Expanded(child: 
          // widget - refers to the instance of the NotesListScreen widget that is being built. It allows us to access the properties and methods of the NotesListScreen class from within the _NotesListScreenState class. 
        ListView.builder(itemCount: widget.notesModel?.noteCount ?? 0,
          itemBuilder: (context, index) {
            // ! - null check operator, used to show that the value is not null
            return NoteCard (note: widget.notesModel!.getNote(index), onDelete: () {
              setState(() {
                widget.notesModel?.deleteNote(note: widget.notesModel!.getNote(index));
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
                builder: (context) => AddEditNoteScreen(notesModel: widget.notesModel,),  
              )
            );
          },
          child: const Icon(Icons.add)
      )
    );
  }
  
}