import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/notes_model.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/screens/notes_list_screen.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class AddEditNoteScreen extends StatefulWidget {
  final NotesModel? notesModel;
  // super.key is used to pass the key to the parent class (StatefulWidget) constructor. used to track widgets in the widget tree and optimize the build process.
  const AddEditNoteScreen({super.key, required this.notesModel});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final myController = TextEditingController();
   late NotesModel notesModel; // Create an instance of NotesModel to manage notes

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.notesModel == null){
        notesModel = NotesModel();// Initialize the NotesModel instance
    } else {
        notesModel = widget.notesModel!;
    }

    //check to see if the  notesModel is  0 
    // if 0 initialize, if not 0, do not initialize, use widget.notesModel that will be passed from the NotesListScreen
    Logger().d("NotesModel initialized with ${notesModel.noteCount} notes.");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Add Note"),
            actions: [
              Padding(
                padding:  const EdgeInsets.only(right: 20.0),
                child:
                ElevatedButton(
                  onPressed: () {
                    // Save the note and navigate back
                    setState(() {
                      notesModel.addNote(Note(id: const Uuid().v4().toString(), title: myController.text.substring(0, 8), content: myController.text), null);
                      Logger().d(notesModel.getNote(notesModel.noteCount - 1).content);
                      Logger().d("Note added. Total notes: ${notesModel.noteCount}");

                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NotesListScreen(notesModel: notesModel),
                      ),
                    );
                  },
                  // child: const Text("Save"),

                  child: const Icon(Icons.check),
                ),
              )
            ],            
        ),
    
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          // column - finite height, textfield - infinite height
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Start typing ...",
                      border: InputBorder.none
                    ),
                  maxLines: null,// Allow multiple lines
                  expands: true,  // fills available space
                  controller: myController,
                ),//textfield is a scrollable 
              ), 
              
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  
 
  }   
  
        

}