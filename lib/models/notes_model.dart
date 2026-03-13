import 'note.dart';

class NotesModel {
  //It is private to prevent direct modification from outside the class.
  //final - means that the variable cannot be reassigned after it has been initialized. This is used to ensure that the list of notes cannot be replaced with a different list, but the contents of the list can still be modified (e.g., adding or removing notes).
  final List<Note> _notes = [];

//noteCount is a getter that returns the number of notes in the list.
// It is defined as a getter because it does not take any parameters and is used to retrieve a value rather than perform an action.
// => shorthand syntax for a function that returns a single expression. It is equivalent to writing:
// int get noteCount {  
//   return notes.length;
// }
  int get noteCount => _notes.length;

//getNote is a method that takes an index as a parameter and returns the note at that index in the list of notes. It is defined as a method because it performs an action (retrieving a note) and takes a parameter (the index).
  //Note - return type (returning a Note object)
  Note getNote(int index) =>  (index >=0 && index < _notes.length) ? _notes[index] : throw ArgumentError("Index out of bounds");

// // The constructor for the NotesModel class. It is currently empty, but it can be used to initialize any necessary data or perform any setup when an instance of the class is created.
//   NotesModel();

  void deleteNote({required Note note}) {
    Note noteToDelete = _notes.firstWhere((element) => element.id == note.id);
    _notes.remove(noteToDelete);
  }

  void addNote(Note note, int? editIndex) {
    if (editIndex != null && editIndex >= 0 && editIndex < _notes.length) {
      _notes[editIndex] = note;
    } else {
      _notes.add(note);
    }
  }

  List<int> searchNotes(String query){
    // search for notes that contain the query in their title or content
    // return a list of matching note indices
    // case-insensitive search
    List<int> matchingIndices = [];
    //asMap - converts the list of notes into a map where the keys are the indices and the values are the notes themselves. This allows us to access both the index and the note in the loop.
    _notes.asMap().forEach((index, note){
      if(note.title.toLowerCase().contains(query.toLowerCase()) || note.content.toLowerCase().contains(query.toLowerCase())){
        matchingIndices.add(index);
      }
    }
    );
    return matchingIndices;
  }
}

