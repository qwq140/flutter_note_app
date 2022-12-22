import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/delete_note_use_case.dart';
import 'package:note_app/domain/use_case/get_notes_use_case.dart';
import 'package:note_app/domain/use_case/use_cases.dart';
import 'package:note_app/presentation/notes/notes_event.dart';
import 'package:note_app/presentation/notes/notes_state.dart';
import 'package:note_app/util/note_order.dart';
import 'package:note_app/util/order_type.dart';

// ViewModel에서는 복잡한 로직을 사용하지 않는다.
class NotesViewModel with ChangeNotifier {
  final UseCases useCases;

  NotesState _state = NotesState(notes: [], noteOrder: const NoteOrder.date(OrderType.descending()));
  NotesState get state => _state;

  Note? _recentlyDeletedNote;

  NotesViewModel(this.useCases){
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
      changeOrder: (noteOrder) {
        _state = state.copyWith(noteOrder: noteOrder);
        _loadNotes();
      },
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes(state.noteOrder);
    _state = state.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNote(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if(_recentlyDeletedNote != null){
      await useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      await _loadNotes();
    }
  }
}
