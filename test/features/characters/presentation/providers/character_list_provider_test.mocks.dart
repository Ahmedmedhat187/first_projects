import 'package:mockito/mockito.dart';
import 'package:samurai_studios/core/network/api_result.dart';
import 'package:samurai_studios/features/characters/domain/repositories/character_repository.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {
  @override
  Future<ApiResult<CharacterPaginatedResult>> getCharacters({int page = 1}) =>
      super.noSuchMethod(
        Invocation.method(#getCharacters, [], {#page: page}),
        returnValue: Future.value(
          Success(
            CharacterPaginatedResult(
              characters: const [],
              currentPage: 1,
              totalPages: 1,
              hasNextPage: false,
            ),
          ),
        ),
      );
}
