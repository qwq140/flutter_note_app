import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/presentation/notes/components/note_item.dart';
import 'package:note_app/ui/colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your note'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            NoteItem(
              note: Note(
                title: '제목',
                content: '내용',
                color: wisteria.value,
                timestamp: 0,
              ),
            ),
            NoteItem(
              note: Note(
                title: '제목',
                content: '내용',
                color: skyBlue.value,
                timestamp: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
