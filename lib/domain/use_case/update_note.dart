import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class UpdateNote {
  final NoteRepository repository;

  UpdateNote(this.repository);

  Future<void> call(Note note) async {
    await repository.updateNote(note);
  }
}