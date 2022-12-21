import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

// 화면에서의 기능을 use case에서 구현
class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNotes();
    notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
    return notes;
  }
}