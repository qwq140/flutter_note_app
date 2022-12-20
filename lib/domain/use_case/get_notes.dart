import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

// 화면에서의 기능을 use case에서 구현
class GetNotes {
  final NoteRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNotes();
    return notes;
  }
}