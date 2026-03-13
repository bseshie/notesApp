class Note {
  final String id;
  String title;
  String content;

  Note({required this.id, required this.title, required this.content}){
    if(title.isEmpty){
      title = "Untitled Note";
    }
    if(content.isEmpty){
      content = "No content";
    }
    // var uuid = Uuid();
    // id = uuid.v4();
  }

}