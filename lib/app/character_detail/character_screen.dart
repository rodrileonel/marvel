import 'package:flutter/material.dart';
import 'package:marvel/domain/model/character.dart';
import 'package:marvel/widgets/marvel_container.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name ?? '')),
      body: ListView(
        children: [
          MarvelContainer(
              title: 'COMICS',
              child: Column(
                  children:
                      character.comics?.map((c) => Text(c)).toList() ?? [])),
          MarvelContainer(
              title: 'EVENTS',
              child: Column(
                  children:
                      character.events?.map((c) => Text(c)).toList() ?? [])),
          MarvelContainer(
              title: 'SERIES',
              child: Column(
                  children:
                      character.series?.map((c) => Text(c)).toList() ?? [])),
          MarvelContainer(
              title: 'STORIES',
              child: Column(
                  children:
                      character.stories?.map((c) => Text(c)).toList() ?? [])),
        ],
      ),
    );
  }
}
