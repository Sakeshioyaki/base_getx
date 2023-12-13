import 'package:base_getx/modals/note_model.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final ThemeData theme;
  final NoteModel note;
  const NoteItem({super.key, required this.theme, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: theme.colorScheme.surfaceVariant,
      elevation: 1,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title ?? ''),
            Text(note.content ?? ''),
          ],
        ),
      ),
    );
  }
}
