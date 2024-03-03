import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/data/model/characters.dart';
import 'package:movie/data/repository/character_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepo characterRepo;
  late List<Character> characters;
  CharactersCubit(this.characterRepo) : super(CharactersInitial());


  List<Character> emitAllCharacters() {
    characterRepo.fitchAllCharacter().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
