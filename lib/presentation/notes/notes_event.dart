import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/util/note_order.dart';

part 'notes_event.freezed.dart';

// notes 화면상에서 일어날 수 있는 이벤트 정의
// 로딩, 삭제, 삭제 취소
@freezed
abstract class NotesEvent with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote;
  const factory NotesEvent.changeOrder(NoteOrder noteOrder) = ChangeOrder;
  const factory NotesEvent.toggleOrderSection() = ToggleOrderSection;
}
