import 'package:flutter/material.dart';

class NoteWidgets extends StatelessWidget {
  const NoteWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(

        ),
        Text('djfsajfsklaf'),
        Icon(
          Icons.add_a_photo,
          color: Colors.red,
          size: 100,
        )
      ],
    );
  }
}
