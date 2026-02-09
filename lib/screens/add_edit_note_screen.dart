import 'package:flutter/material.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
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
                      
                    });
                    Navigator.of(context).pop();
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
                ),//textfield is a scrollable 
              ), 
              
            ],
          ),
        ),
    
    );
    
  }   
        

}