import 'package:movie/data/model/characters.dart';
import 'package:movie/data/web_services/character_webservise.dart';

class CharacterRepo {
  final CharacterWebService characterWebService;

  CharacterRepo({required this.characterWebService});

  Future<List<Character>> fitchAllCharacter() async {
    final characters = await characterWebService.getAllCharacter();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
