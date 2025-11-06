import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(character.image, height: 250),
            ),
            const SizedBox(height: 20),
            Text(
              character.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Especie: ${character.species}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Estado: ${character.status}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
