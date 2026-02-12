import 'package:mockito/mockito.dart';
import 'package:samurai_studios/features/characters/data/datasources/character_remote_datasource.dart';
import 'package:samurai_studios/features/characters/data/models/character_response_dto.dart';

class MockCharacterRemoteDataSource extends Mock
    implements CharacterRemoteDataSource {
  @override
  Future<CharacterResponseDto> getCharacters({int page = 1}) =>
      super.noSuchMethod(
        Invocation.method(#getCharacters, [], {#page: page}),
        returnValue: Future.value(
          const CharacterResponseDto(
            info: InfoDto(count: 0, pages: 0),
            results: [],
          ),
        ),
      );
}
