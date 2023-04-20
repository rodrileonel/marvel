import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/app/character_detail/character_screen.dart';
import 'package:marvel/domain/bloc/characters_bloc.dart';
import 'package:marvel/widgets/character_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetIt.I.get<CharactersBloc>()
          ..add(const CharactersEvent.getCharacters()),
        child: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: () => const Center(child: Text('ERROR')),
          success: (characters) => ListView(
            physics: const ClampingScrollPhysics(),
            children: characters
                .map((e) => CharacterContainer(
                    name: e.name,
                    img: e.thumbnail,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute( 
                            builder: (context) =>  CharacterScreen(character: e)))))
                .toList(),
          ),
        );
      },
    );
  }
}
