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
            Text('Estado: ${character.status}', style: const TextStyle(fontSize: 18)),
            Text('Género: ${character.gender}', style: const TextStyle(fontSize: 18)),
            const Divider(height: 30),
            Text('Origen: ${character.origin}', style: const TextStyle(fontSize: 18)),
            Text('Ubicación actual: ${character.location}', style: const TextStyle(fontSize: 18)),
            const Divider(height: 30),
            Text('Aparece en ${character.episodes.length} episodios:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...character.episodes.take(5).map((e) => Text(e, style: const TextStyle(fontSize: 14))),
            if (character.episodes.length > 5)
              Text('... (${character.episodes.length - 5} más)',
                  style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
            const Divider(height: 30),
            Text('Creado en la API: ${character.created}',
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
