import 'package:flutter/material.dart';
import 'package:note_app/ui/colors.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final List<Color> noteColors = [
    roseBud,
    primRose,
    wisteria,
    skyBlue,
    illusion,
  ];

  Color _color = roseBud;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: AnimatedContainer(
          padding: const EdgeInsets.all(16),
          color: _color,
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: noteColors
                    .map(
                      (color) => InkWell(
                        onTap: () {
                          _color = color;
                          setState(() {});
                        },
                        child: _buildBackgroundColor(
                          color: color,
                          selected: _color == color,
                        ),
                      ),
                    )
                    .toList(),
              ),
              TextField(
                maxLines: 1,
                cursorColor: darkGray,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: darkGray),
                decoration: const InputDecoration(
                  hintText: '제목을 입력하세요',
                  border: InputBorder.none,
                ),
              ),
              TextField(
                maxLines: null,
                cursorColor: darkGray,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: darkGray),
                decoration: const InputDecoration(
                  hintText: '내용을 입력하세요',
                  border: InputBorder.none,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundColor({required Color color, required bool selected}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
        border: selected
            ? Border.all(
                color: Colors.black,
                width: 2,
              )
            : null,
      ),
    );
  }
}
